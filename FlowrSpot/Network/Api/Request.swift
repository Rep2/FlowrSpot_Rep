//
//  Request.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 17/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Alamofire

protocol Request {
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: Parameters? { get }
  var headers: HTTPHeaders? { get }
  var encoding: ParameterEncoding { get }
}

extension Request {
  var method: HTTPMethod {
    return .get
  }
  
  var parameters: Parameters? {
    return nil
  }
  
  var headers: HTTPHeaders? {
    return nil
  }
  
  var encoding: ParameterEncoding {
    return JSONEncoding.default
  }
}
