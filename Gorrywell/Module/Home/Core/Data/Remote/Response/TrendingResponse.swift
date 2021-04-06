//
//  TrendingResponse.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation

struct TrendingResponse: Codable {
  
  let url: TrendingModelResponse
}

struct TrendingModelResponse: Codable {
  
  let id: String?
  let urls: UrlsResponse
}

struct UrlsResponse: Codable {
  
  let regular: String?
}
