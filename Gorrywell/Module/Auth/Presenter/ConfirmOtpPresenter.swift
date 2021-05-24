//
//  ConfirmOtpPresenter.swift
//  Gorrywell
//
//  Created by aamaulana10 on 08/04/21.
//

import Foundation
import Combine

class ConfirmOtpPresenter: ObservableObject {
  
  //    private let router = HomeRouter()
  private let authUseCase: AuthUseCase
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  var presenter: OTPPresenterProtocol?
  
  private var cancellables: Set<AnyCancellable> = []
  
  init(authUseCase: AuthUseCase) {
    
    self.authUseCase = authUseCase
  }
  
  func confirmOtp(phone: String, otp: String) {
    
    loadingState = true
    authUseCase.confirmOTP(phone: phone, OTP: otp)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
          
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { data in

        self.loadingState = false
        
        self.presenter?.confirmOtp(success: true, message: "Success", user: data)
        
      })
      .store(in: &cancellables)
    
  }
  
}

protocol OTPPresenterProtocol {
  
  func confirmOtp(success: Bool, message: String, user: UserModel)
}
