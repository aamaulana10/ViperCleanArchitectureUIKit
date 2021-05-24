//
//  AuthInteractor.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import Combine

protocol AuthUseCase {
    
  func loginByPhone(phone: String) -> AnyPublisher<Bool, Error>
  func confirmOTP(phone: String, OTP: String) -> AnyPublisher<UserModel, Error>
  func getUserSession() -> AnyPublisher<UserModel, Error>
    
}

class AuthInteractor: AuthUseCase {
    
    private let repository: AuthRepositoryProtocol
    
    required init(repository: AuthRepositoryProtocol) {
       
        self.repository = repository
    }
    
    func loginByPhone(phone: String) -> AnyPublisher<Bool, Error> {
       
      return repository.loginByPhone(phone: phone)
    }
  
  func confirmOTP(phone: String, OTP: String) -> AnyPublisher<UserModel, Error> {
    
    return repository.confirmOTP(phone: phone, OTP: OTP)
  }
  
  func getUserSession() -> AnyPublisher<UserModel, Error> {
    
    return repository.getUserSession()
  }
    
}
