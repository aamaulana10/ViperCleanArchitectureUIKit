//
//  ApiCall.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation

struct API {
  
  #if DEBUG

  static let baseUrl   = "https://api.unsplash.com/"
  static let monjarV21 = "https://dev.monjar.co/api/V2.1"
  
  static let clientId  = "hI1LyI66SQoVOITT_HhXnqNVMBdiVeXwIDxRW8JCi3o"
  
  #else
  
  static let baseUrl   = "https://api.unsplash.com/"
  static let monjarV21 = "https://dev.monjar.co/api/V2.1"

  static let clientId  = "hI1LyI66SQoVOITT_HhXnqNVMBdiVeXwIDxRW8JCi3o"
  
  #endif
}

extension API {
  
  static func getTrending() -> String {
    
    return "\(API.baseUrl)photos?client_id=\(API.clientId)&page=1&per_page=30"
  }
  
  static func loginByPhone() -> String {
    
    return "\(API.monjarV21)/auth/login/phonenumber"
  }
  
  static func confirmOTP() -> String {
    
    return "\(API.monjarV21)/auth/login/phonenumber/confirm"
  }
}
