//
//  HomePageViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation
import Combine

class HomePageViewModel: ObservableObject {
    @Published var mainList = [homePage2]() // assuming HomePage2 is your Quotation model
    @Published var scanIndex: Int = 0
    @Published var userId: Int = 0
    @Published var errorMessage = ""
    @Published var isLoading = false
   //@Published var userId1: LoginViewModel
    private var repository = HomePageRepository()
    
   
    func loadMains(userid: Int) {
        
        repository.postMainApi(userid: userId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print("data \(data)")
                    self?.mainList = data.response.quotations
                    self?.scanIndex = data.response.scanIndex
                    print("Veriler başarıyla alındı: \(self?.mainList)")
                    self?.errorMessage = ""
                case .failure(let error):
                    print("error \(error)")
                    self?.errorMessage = error
                    print("Hata: \(error)")
                }
            }
        }
    }
    func loadMore(scanIndex: Int) {
        repository.postMainApi(userid: userId , scanIndex: scanIndex) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print("data \(data)")
                    self?.mainList = data.response.quotations
                    self?.scanIndex = data.response.scanIndex
                    print("Veriler başarıyla alındı: \(self?.mainList)")
                    self?.errorMessage = ""
                case .failure(let error):
                    print("error \(error)")
                    self?.errorMessage = error
                    print("Hata: \(error)")
                }
            }
        }
    }
}

