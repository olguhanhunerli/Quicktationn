//
//  RegisterViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 28.04.2023.
//

import Foundation
import Alamofire

class RegisterViewModel : ObservableObject{
    @Published var name = ""
       @Published var email = ""
       @Published var password = ""
      
       func register() {
           let data = RegisterData(name: name, email: email, password: password)
           let encoder = JSONEncoder()
           do {
               let jsonData = try encoder.encode(data)
               Alamofire.request("https://your-api.com/register", method: .post, parameters: ["data": jsonData], encoding: JSONEncoding.default)
                   .responseData { (response) in
                       switch response.result {
                       case .success(let data):
                           print(data)
                       case .failure(let error):
                           print(error)
                       }
               }
           } catch {
               print(error)
           }
       }
   }
