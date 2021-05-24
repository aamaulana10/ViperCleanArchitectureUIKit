//
//  VerifOTPViewController.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import UIKit

class VerifOTPViewController: UIViewController {
  
  @IBOutlet weak var otp: UITextField!
  @IBOutlet weak var btnResend: UIButton!
  @IBOutlet weak var btnSubmit: UIButton!
  
  var presenter: ConfirmOtpPresenter!
  var phoneNumber = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

      btnSubmit.layer.cornerRadius = 10
      
      hideKeyboardWhenTappedAround()
      
      setupTextField()
      
      presenter.presenter = self
    }
    
  @IBAction func back(_ sender: UIButton) {
    
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func resendOTP(_ sender: UIButton) {}
  
  @IBAction func submitOTP(_ sender: UIButton) {}
  
  func setupTextField() {
    
    otp.addTarget(self, action: #selector(textfieldDidEnd), for: .editingDidEndOnExit)
    
    otp.keyboardType = .numbersAndPunctuation
    otp.returnKeyType = .continue
  }
  
  @objc func textfieldDidEnd() {
    
    presenter.confirmOtp(phone: phoneNumber, otp: otp.text ?? "")
  }
  
}

extension VerifOTPViewController: OTPPresenterProtocol {
  
  func confirmOtp(success: Bool, message: String, user: UserModel) {}
  
}
