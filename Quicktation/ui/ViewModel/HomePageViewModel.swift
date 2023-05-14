//
//  HomePageViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation
import Combine
class HomePageViewModel: ObservableObject{
    @Published var users: [homePage] = []
    private var cancellables = Set<AnyCancellable>()
    private var scanIndex: Int = 0
    private var userId: Int = 1
    private let homePageService = homePageItems()
    
    init() {
        fetchUser()
    }
    func fetchUser() {
            if users.isEmpty || users.last?.scanIndex != -1 {
                homePageService.fetchUser(userId: userId)
                    .sink(receiveCompletion: { _ in },
                          receiveValue: {[weak self] user in
                        self?.users.append(user)
                        self?.userId += 1
                    })
                    .store(in: &cancellables)
            }
        }
}
