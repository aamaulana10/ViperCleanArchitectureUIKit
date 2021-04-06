//
//  TrendingMapper.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import RealmSwift

final class TrendingMapper {
  
  static func mapTrendingResponsesToDomains(
    input trendingResponses: [TrendingModelResponse]
  ) -> [TrendingModel] {
    
    return trendingResponses.map { result in
      
      return TrendingModel(
        id: result.id ?? "Unknown",
        urls: mapUrlResponseToModel(input: result.urls)
      )
    }
  }
  
  static func mapTrendingResponsesToEntities(
    input trendingResponses: [TrendingModel]
  ) -> [TrendingEntity] {
    
    return trendingResponses.map { result in
      
      let newTrending = TrendingEntity()
      newTrending.id = result.id
      newTrending.urls = mapUrlModelToEntities(input: result.urls)
      return newTrending
    }
  }
  
  static func mapTrendingEntitiesToDomains(
    input trendingEntities: [TrendingEntity]
  ) -> [TrendingModel] {
    
    return trendingEntities.map { result in
      
      return TrendingModel(
        id: result.id,
        urls: mapUrlEntitesToModel(input: result.urls)
      )
    }
  }
}

extension TrendingMapper {
  
  static func mapUrlResponseToModel(
    input url: UrlsResponse) -> UrlsModel {
    
    return UrlsModel(
      regular: url.regular ?? "Unknown"
    )
  }
  
  static func mapUrlModelToEntities(
    input url: UrlsModel) -> UrlsEntities {
    
    let newUrl = UrlsEntities()
    
    newUrl.regular = url.regular
    
    return newUrl
  }
  
  static func mapUrlEntitesToModel(
    input url: UrlsEntities?) -> UrlsModel {
    
    return UrlsModel(regular: url?.regular ?? "")
  }
}
