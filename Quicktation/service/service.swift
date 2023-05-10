//
//  service.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 10.05.2023.
//

import Foundation
import Alamofire

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
                switch response.result {
                case .success(let registerResponse):
                    completion(.success(registerResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

/*let parameters: [String: Any] = [
    "name": user.namesurname,
    "email": user.email,
    "password": user.password,
    "username": user.username
]*/
