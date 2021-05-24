//
//  RemoteDataSource.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import Alamofire
import Combine

protocol AuthRemoteDataSourceProtocol: class {
    
    func loginByPhone(phone: String) -> AnyPublisher<Bool, Error>
    func confirmOTP(phone: String, OTP: String)
      -> AnyPublisher<UserModelDataResponse, Error>

}

final class AuthRemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: AuthRemoteDataSource =  AuthRemoteDataSource()
    
}

extension AuthRemoteDataSource: AuthRemoteDataSourceProtocol {
    
  func loginByPhone(phone: String) -> AnyPublisher<Bool, Error> {
    
    let parameters: Parameters = ["phoneNumber": phone] as [String: Any]
       
        return Future<Bool, Error> { completion in
          if let url = URL(string: API.loginByPhone()) {
            AF.request(url, method: .post, parameters: parameters)
             .validate()
             .responseJSON { response in
          
               switch response.result {
               case .success:
                
                completion(.success(true))
               case .failure:
                 completion(.failure(URLError.invalidResponse))
               }
             }
         }
       }.eraseToAnyPublisher()
     }
  
  func confirmOTP(phone: String, OTP: String)
      -> AnyPublisher<UserModelDataResponse, Error> {
    
    let parameters = ["phoneNumber": phone, "otp": OTP] as [String: Any]
       
        return Future<UserModelDataResponse, Error> { completion in
          if let url = URL(string: API.confirmOTP()) {
            AF.request(url, method: .post, parameters: parameters)
             .validate()
              .responseDecodable(of: UserResponse.self) { response in
           
                switch response.result {
                case .success(let value):
                  
                  completion(.success(value.data))
                  
                case .failure:
                  
                  completion(.failure(URLError.invalidResponse))
                }
              }
         }
       }.eraseToAnyPublisher()
  }
}
