//
//  ApiCall.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation

struct API {

  static let baseUrl   = "https://api.unsplash.com/"

  static let clientId  = "hI1LyI66SQoVOITT_HhXnqNVMBdiVeXwIDxRW8JCi3o"
}

extension API {
  
  static func getTrending() -> String {
    
    return "\(API.baseUrl)photos?client_id=\(API.clientId)&page=1&per_page=30"
  }
}
