//
//  AuthLocaleDataSource.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import RealmSwift
import Combine

protocol AuthLocaleDataSourceProtocol: class {
    
  func getUserSession() -> AnyPublisher<SessionEntity, Error>
  func addUserSession(from session: SessionEntity) -> AnyPublisher<Bool, Error>
}

final class AuthLocaleDataSource: NSObject {
    
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> AuthLocaleDataSource = { realmDatabase in
        
        return AuthLocaleDataSource(realm: realmDatabase)
    }
    
}

extension AuthLocaleDataSource: AuthLocaleDataSourceProtocol {
  
  func getUserSession() -> AnyPublisher<SessionEntity, Error> {
      
      return Future<SessionEntity, Error> { completion in
          if let realm = self.realm {
            
            if let session = realm.objects(SessionEntity.self).first {
              
              completion(.success(session))
            }
          } else {
        
              completion(.failure(DatabaseError.invalidInstance))
          }
      }.eraseToAnyPublisher()
  }
  
  func addUserSession(
      from session: SessionEntity
  ) -> AnyPublisher<Bool, Error> {
      
      return Future<Bool, Error> { completion in
          if let realm = self.realm {
              do {
                  try realm.write {
                      
                      realm.add(session, update: .all)
                      completion(.success(true))
                  }
              } catch {
                  completion(.failure(DatabaseError.requestFailed))
              }
          } else {
              completion(.failure(DatabaseError.invalidInstance))
          }
      }.eraseToAnyPublisher()
  }
    
}
