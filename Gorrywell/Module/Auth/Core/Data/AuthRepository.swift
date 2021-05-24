//
//  AuthRepository.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import Combine

protocol AuthRepositoryProtocol {
  
  func loginByPhone(phone: String) -> AnyPublisher<Bool, Error>
  
  func confirmOTP(phone: String, OTP: String) -> AnyPublisher<UserModel, Error>
  
  func getUserSession() -> AnyPublisher<UserModel, Error>
}

final class AuthRepository: NSObject {
  
  typealias AuthRepositoryInstance = (AuthLocaleDataSource,
                                      AuthRemoteDataSource)
    -> AuthRepository
  fileprivate let remote: AuthRemoteDataSource
  fileprivate let locale: AuthLocaleDataSource
  private init(locale: AuthLocaleDataSource, remote: AuthRemoteDataSource) {
    
    self.remote = remote
    self.locale = locale
  }
  static let sharedInstance: AuthRepositoryInstance = { localeRepo, remoteRepo in
    
    return AuthRepository(locale: localeRepo, remote: remoteRepo)
  }
  
}

extension AuthRepository: AuthRepositoryProtocol {
  
  func loginByPhone(phone: String) -> AnyPublisher<Bool, Error> {
    
    return remote.loginByPhone(phone: phone).eraseToAnyPublisher()
  }
  
  func confirmOTP(phone: String, OTP: String) -> AnyPublisher<UserModel, Error> {
    
    return remote.confirmOTP(phone: phone, OTP: OTP)
      .map { LoginMapper.mapLoginResponsesToDomains(input: $0 ) }
      .map { LoginMapper.mapLoginResponsesToEntities(input: $0) }
      .flatMap { self.locale.addUserSession(from: $0) }
      .filter { $0 }
      .flatMap { _ in self.locale.getUserSession()
        .map { LoginMapper.mapLoginEntitiesToDomains(input: $0) }
      }.eraseToAnyPublisher()
  }
  
  func getUserSession() -> AnyPublisher<UserModel, Error> {
    
    return locale.getUserSession()
      .map {LoginMapper.mapLoginEntitiesToDomains(input: $0)}
      .eraseToAnyPublisher()
    
  }
  
}
