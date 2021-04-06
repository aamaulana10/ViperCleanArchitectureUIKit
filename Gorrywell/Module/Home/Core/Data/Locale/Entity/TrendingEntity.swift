//
//  TrendingEntity.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import RealmSwift

class TrendingEntity: Object {
  
  @objc dynamic var id: String = ""
  @objc dynamic var urls: UrlsEntities?
  
  override static func primaryKey() -> String? {
    
      return "id"
  }
}

class UrlsEntities: Object {
  
  @objc dynamic var regular: String = ""
}
