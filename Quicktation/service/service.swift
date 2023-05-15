//
//  service.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 10.05.2023.
//

import Foundation
import Alamofire
import Combine
class registerService {
    let baseURL = QuicktationService().baseUrl

        func registerUser(user: RegisterPageModel, completion: @escaping (Result<RegisterResponse, Error>) -> Void) {
            let registerURL = "\(baseURL)/register"
            let parameters: [String: Any] = [
                "email": user.email,
                "password": user.password,
                "namesurname": user.namesurname,
                "username": user.username
            ]
            var urlRequest = URLRequest(url: URL(string: registerURL)!)
                    urlRequest.httpMethod = HTTPMethod.post.rawValue
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

                    let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
                    urlRequest.httpBody = jsonData

            AF.request(registerURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseDecodable(of: RegisterResponse.self) { response in
                print("API Response: \(response)")
                switch response.result {
                case .success(let registerResponse):
                    completion(.success(registerResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
class LoginService {
    let baseURL = QuicktationService().baseUrl
    
    func loginUser(user: LoginModel, completion: @escaping (Result<LoginResponse , Error>) ->Void){
        let loginURL = "\(baseURL)/login"
        let parameters: [String: Any] = [
            "email": user.email,
            "password": user.password
        ]
        
        
        var urlRequest = URLRequest(url: URL(string: loginURL)!)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        urlRequest.httpBody = jsonData
        
        AF.request(loginURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseDecodable(of: LoginResponse.self) { response in
            print("API Response: \(response)")
            switch response.result {
            case .success(let loginResponse):
                completion(.success(loginResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
class homePageService {
    let baseURL = QuicktationService().baseUrl
    func homePage(completion: @escaping (Result<homepageData, Error>) -> Void) {
        let homePageURL = "\(baseURL)/homepageitems"
        var urlRequest = URLRequest(url: URL(string: homePageURL)!)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request("https://yourapiurl.com/path").responseDecodable { (response: DataResponse<homePage, AFError>) in
            switch response.result {
            case .success(let data):
                completion(.success(data.response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
