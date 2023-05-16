//
//  service.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 10.05.2023.
//

import Foundation
import Alamofire
import Combine
let baseURL = QuicktationService().baseUrl
enum Resource<T> {
    case success(T)
    case failure(String)
}
class registerService {
    
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
    func postMainApi(userid: Int, scanIndex: Int, completion: @escaping (Result<homePageResponse2, Error>) -> Void) {
            let url = "\(baseURL)/homepageitems"
            let parameters: Parameters = ["userId": userid, "scanIndex": scanIndex]
            let headers: HTTPHeaders = ["Content-Type":"application/json"]

            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .responseDecodable(of: homePageResponse2.self) { response in
                    
                    switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        
                        completion(.failure(error))
                    }
                }
        }
    
    }

    
