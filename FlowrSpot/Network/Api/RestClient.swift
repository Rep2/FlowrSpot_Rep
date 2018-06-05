//
//  ApiClient.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 17/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Alamofire

struct RestClient {
  
  typealias JSON = [String: Any]
  typealias SuccessCompletion<T> = ((T) -> Void)?
  typealias FailureCompletion = ((RemoteResourceError) -> Void)?

  static let shared = RestClient()
  
  func request(_ request: Request, version: Version, success: SuccessCompletion<JSON>, failure: FailureCompletion) {
    let request = prepareRequest(request, host: host, version: version)
    request.validate().response { (response) in
      do {
        try self.validateResponse(response)
        var json = JSON()
        if let data = response.data, let responseJson = try self.serializeToJson(data: data) {
          json = responseJson
        }
        
        success?(json)
      } catch {
        let responseError = error as? RemoteResourceError ?? RemoteResourceError.generic
        failure?(responseError)
      }
    }
  }
}

private extension RestClient {
  func prepareRequest(_ request: Request, host: Host, version: Version) -> DataRequest {
    let endpointUrl = "\(host.rawValue)\(version.rawValue)/\(request.path)"
    return Alamofire.request(endpointUrl, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers)
  }
  
  func validateResponse(_ response: DefaultDataResponse) throws {
    let statusCode = response.response?.statusCode ?? 0
    
    switch statusCode {
    case 401:
      throw RemoteResourceError.invalidCredentials
    case 500..<Int.max:
      throw RemoteResourceError.server(statusCode: statusCode)
    case 400..<500:
      throw RemoteResourceError.request(statusCode: statusCode)
    case 0:
      if let urlError = response.error as? URLError {
        switch urlError.code {
        case URLError.timedOut:
          throw RemoteResourceError.timeout
        case URLError.notConnectedToInternet, URLError.networkConnectionLost:
          throw RemoteResourceError.noInternetConnection
        default:
          throw RemoteResourceError.generic
        }
      }
    default:
      break
    }
  }
  
  func serializeToJson(data: Data) throws -> JSON? {
    return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
  }
  
  var host: Host {
    return Constants.Environment.isProduction ? .production : .development
  }
}
