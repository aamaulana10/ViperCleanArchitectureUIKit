//
//  HomeInteractor.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import Combine

protocol HomeUseCase {
    
    func getTrending() -> AnyPublisher<[TrendingModel], Error>
    
}

class HomeInteractor: HomeUseCase {
    
    private let repository: HomeRepositoryProtocol
    
    required init(repository: HomeRepositoryProtocol) {
       
        self.repository = repository
    }
    
    func getTrending() -> AnyPublisher<[TrendingModel], Error> {
       
        return repository.getTrending()
    }
    
}
