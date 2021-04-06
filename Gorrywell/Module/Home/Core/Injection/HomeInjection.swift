//
//  HomeInjection.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import RealmSwift

final class HomeInjection: NSObject {
  
  private func provideRepository() -> HomeRepositoryProtocol {
    
    let realm = try? Realm()
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return HomeRepository.sharedInstance(locale, remote)
  }
  
  func provideHome() -> HomeUseCase {
    
    let repository = provideRepository()
    
    return HomeInteractor(repository: repository)
  }
  
}
