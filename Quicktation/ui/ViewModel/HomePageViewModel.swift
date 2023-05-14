//
//  HomePageViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation
import Combine

class HomePageViewModel: ObservableObject {
    @Published var responses: [homeResponse] = []
    private var cancellables = Set<AnyCancellable>()
    private var scanIndex: Int = 0
    private let homePageService = homePageItems()
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        if responses.isEmpty || responses.last?.scanIndex != -1 {
            homePageService.fetchUser(userId: scanIndex + 1)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }, receiveValue: {[weak self] response in
                    self?.responses.append(response)
                    self?.scanIndex += 1
                })
                .store(in: &cancellables)
        }
    }
}
