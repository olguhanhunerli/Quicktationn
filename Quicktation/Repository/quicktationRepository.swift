//
//  quicktationRepository.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 16.05.2023.
//

import Foundation
class HomePageRepository {
    private var apiService = homePageService()
    
    func postMainApi(userid: Int, scanIndex: Int = 0, completion: @escaping (Resource<homePageResponse2>) -> Void) {
        apiService.postMainApi(userid: userid, scanIndex: scanIndex) { result in
            switch result {
            case .success(let response):
                switch response.error {
                case "0":
                    completion(.success(response))
                case "1":
                    completion(.failure(response.errorText))
                    print("error \(response)")
                default:
                    completion(.failure("Beklenmeyen bir hata oluştu."))
                }
            case .failure(let error):
                print("Error in Repository: \(error.localizedDescription)")
                completion(.failure(error.localizedDescription))
            }
        }
    }
}
