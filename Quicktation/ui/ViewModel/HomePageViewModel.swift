//
//  HomePageViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation
import Combine

class HomePageViewModel: ObservableObject {
        @Published var quotations = [homePagee]()
        private var apiService = homePageService()

        init() {
            fetchQuotations()
        }

        func fetchQuotations() {
            apiService.homePage { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self?.quotations = data.quotations
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

