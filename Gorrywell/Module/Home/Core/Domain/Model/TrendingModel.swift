//
//  TrendingModel.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation

struct TrendingModel: Codable {
  
  let id: String
  let urls: UrlsModel
}

struct UrlsModel: Codable {
  
  let regular: String
}
