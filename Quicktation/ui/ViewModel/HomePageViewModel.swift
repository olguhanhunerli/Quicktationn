//
//  HomePageViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation
import Combine

/*class HomePageViewModel: ObservableObject {
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
    }*/
class HomePageViewModel: ObservableObject {
    @Published var mainList = [homePage2]() // assuming HomePage2 is your Quotation model
        @Published var scanIndex = 0
        @Published var errorMessage = ""

        private var repository = HomePageRepository()

        func loadMains(userid: Int) {
            repository.postMainApi(userid: userid) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        print("Data \(data)")
                        self?.mainList = data.response.quotations
                       
                        self?.scanIndex = data.response.scanIndex
                        self?.errorMessage = ""
                    case .failure(let error):
                        self?.errorMessage = error
                    }
                }
            }
        }
}

