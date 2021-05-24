//
//  AuthInjection.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import RealmSwift

final class AuthInjection: NSObject {
  
  private func provideRepository() -> AuthRepositoryProtocol {
    
    let realm = try? Realm()
    let locale: AuthLocaleDataSource = AuthLocaleDataSource.sharedInstance(realm)
    let remote: AuthRemoteDataSource = AuthRemoteDataSource.sharedInstance
    
    return AuthRepository.sharedInstance(locale, remote)
  }
  
  func provideAuth() -> AuthUseCase {
    
    let repository = provideRepository()
    
    return AuthInteractor(repository: repository)
  }
  
}
