//
//  LoginViewController.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import UIKit
import Combine
import Lottie

class LoginViewController: UIViewController {
  
  @IBOutlet weak var phoneNumber: UITextField!
  @IBOutlet weak var btnLogin: UIButton!
  
  var presenter: LoginPresenter!
  
  var loading = Loading.loadingInstance
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    btnLogin.layer.cornerRadius = 10
    
    hideKeyboardWhenTappedAround()
    
    setupTextField()
    
    presenter.presenter = self
    
    presenter.getUserSession()
    
  }
  
  @IBAction func login(_ sender: UIButton) {
    
    textfieldDidEnd()
  }
  
  func setupTextField() {
    
    phoneNumber.addTarget(self, action: #selector(textfieldDidEnd), for: .editingDidEndOnExit)
    
    phoneNumber.addTarget(self,
                          action: #selector(self.checkNolPhone), for: .editingChanged)
    
    phoneNumber.keyboardType = .numbersAndPunctuation
    phoneNumber.returnKeyType = .continue
  }
  
  @objc func textfieldDidEnd() {
    
    if phoneNumber.text != ""{
      
      presenter.loginByPhone(phone: phoneNumber.text ?? "")
      
    } else {
      
      return
    }
    
  }
  
  @objc func checkNolPhone() {
    
    if phoneNumber.text != "" {
      
      if phoneNumber.text == "0"{
        
        let formattedPhoneNumber = phoneNumber.text!.dropFirst()
        
        phoneNumber.text = "\(formattedPhoneNumber)"
        
        return
      }
    }
  }
  
}

extension LoginViewController: LoginPresenterProtocol {
  
  func loginPhone(success: Bool, message: String) {
    
    if success == true {
      
      let formattedPhoneNumber = "62" + phoneNumber.text!
      
      if let verifOTP = StoryboardHelper.instantiateVC(
          .authStoryboard, "VerifOTPViewController")
          as? VerifOTPViewController {
        
        let useCase = AuthInjection.init().provideAuth()
        
        let presenter = ConfirmOtpPresenter(authUseCase: useCase)
        
        verifOTP.presenter = presenter
        verifOTP.phoneNumber = formattedPhoneNumber
        
        self.navigationController?.pushViewController(verifOTP, animated: true)
      }
    } else {}
  }
}
