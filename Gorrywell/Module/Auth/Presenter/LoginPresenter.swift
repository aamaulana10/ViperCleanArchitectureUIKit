//
//  LoginPresenter.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import Combine

class LoginPresenter: ObservableObject {
  
  //    private let router = HomeRouter()
  private let authUseCase: AuthUseCase
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  var presenter: LoginPresenterProtocol?
  
  private var cancellables: Set<AnyCancellable> = []
  
  init(authUseCase: AuthUseCase) {
    
    self.authUseCase = authUseCase
  }
  
  func loginByPhone(phone: String) {
    
    loadingState = true
    authUseCase.loginByPhone(phone: phone)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { _ in

        self.loadingState = false
        
        self.presenter?.loginPhone(success: true, message: "Success")
        
      })
      .store(in: &cancellables)
    
  }
  
  func getUserSession() {
    
    loadingState = true
    authUseCase.getUserSession()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
          
        case .finished:
          self.loadingState = false
          
        }
      }, receiveValue: { _ in

        self.loadingState = false
        
      })
      .store(in: &cancellables)
    
  }
  
}

protocol LoginPresenterProtocol {
  
  func loginPhone(success: Bool, message: String)
}
