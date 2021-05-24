//
//  HomePresenter.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import Foundation
import Combine

class HomePresenter: ObservableObject {
  
  //    private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  
  @Published var trending: [TrendingModel] = []
  var errorMessage: String = ""
  var loadingState: Bool = false
  var presenter: HomePresenterProtocol?
  
  var showView = false
  private var cancellables: Set<AnyCancellable> = []
  
  init(homeUseCase: HomeUseCase) {
    
    self.homeUseCase = homeUseCase
  }
  
  func getTrending() {
    
    loadingState = true
    homeUseCase.getTrending()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { data in
        self.trending = data
    
        self.presenter?.getTrending(trending: self.trending)
        
      })
      .store(in: &cancellables)
  }
  
}

protocol HomePresenterProtocol {
  
  func getTrending(trending: [TrendingModel])
}
