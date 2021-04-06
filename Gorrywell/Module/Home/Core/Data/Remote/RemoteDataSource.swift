//
//  RemoteDataSource.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: class {
    
    func getTrending() -> AnyPublisher<[TrendingModelResponse], Error>

}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
  func getTrending() -> AnyPublisher<[TrendingModelResponse], Error> {
       
        return Future<[TrendingModelResponse], Error> { completion in
          if let url = URL(string: API.getTrending()) {
           AF.request(url)
             .validate()
             .responseDecodable(of: [TrendingModelResponse].self) { response in
          
               switch response.result {
               case .success(let value):
                completion(.success(value))
               case .failure:
                 completion(.failure(URLError.invalidResponse))
               }
             }
         }
       }.eraseToAnyPublisher()
     }
    
}
