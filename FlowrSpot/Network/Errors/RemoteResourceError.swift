//
//  RemoteResourceError.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 19/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

enum RemoteResourceError: LocalizedError {
  case noInternetConnection
  case timeout
  case server(statusCode: Int)
  case request(statusCode: Int)
  case invalidCredentials
  case invalidResponse
  case invalidJson
  case generic
  
  public var errorDescription: String? {
    switch self {
    case .noInternetConnection: return "No internet connection!"
    case .timeout: return "Request timeout!"
    case let .server(statusCode): return "Server error with status code: \(statusCode)!"
    case let .request(statusCode): return "Request error with status code: \(statusCode)!"
    case .invalidCredentials: return "Invalid credentials!"
    case .invalidResponse: return "Invalid response!"
    case .generic: return "Generic error!"
    case .invalidJson: return "JSON parsing failed!"
    }
  }
}
