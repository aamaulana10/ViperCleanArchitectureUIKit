//
//  HomeRepository.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    
    func getTrending() -> AnyPublisher<[TrendingModel], Error>
}

final class HomeRepository: NSObject {
    
    typealias HomeRepositoryInstance = (LocaleDataSource,
                                        RemoteDataSource)
      -> HomeRepository
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        
        self.remote = remote
        self.locale = locale
    }
    static let sharedInstance: HomeRepositoryInstance = { localeRepo, remoteRepo in
        
        return HomeRepository(locale: localeRepo, remote: remoteRepo)
    }
    
}

extension HomeRepository: HomeRepositoryProtocol {
    
    func getTrending() -> AnyPublisher<[TrendingModel], Error> {

        return self.locale.getTrending()
            .flatMap { result -> AnyPublisher<[TrendingModel], Error> in
                if result.isEmpty {
                  return self.remote.getTrending()
                        .map { TrendingMapper.mapTrendingResponsesToDomains(input: $0) }
                        .map { TrendingMapper.mapTrendingResponsesToEntities(input: $0) }
                        .flatMap { self.locale.addTrending(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getTrending()
                          .map { TrendingMapper.mapTrendingEntitiesToDomains(input: $0) }
                        }.eraseToAnyPublisher()

                } else {
                    return self.locale.getTrending()
                        .map { TrendingMapper.mapTrendingEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
