//
//  LocaleDataSource.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol: class {
    
    func getTrending() -> AnyPublisher<[TrendingEntity], Error>
    func addTrending(from trending: [TrendingEntity]) -> AnyPublisher<Bool, Error>
}

final class LocaleDataSource: NSObject {
    
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        
        return LocaleDataSource(realm: realmDatabase)
    }
    
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getTrending() -> AnyPublisher<[TrendingEntity], Error> {
        
        return Future<[TrendingEntity], Error> { completion in
            if let realm = self.realm {
                let trendings: Results<TrendingEntity> = {
                    realm.objects(TrendingEntity.self)
                }()
                
                completion(.success(trendings.toArray(ofType: TrendingEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addTrending(
        from trending: [TrendingEntity]
    ) -> AnyPublisher<Bool, Error> {
        
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for trending in trending {
                            realm.add(trending, update: .all)
                        }
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
