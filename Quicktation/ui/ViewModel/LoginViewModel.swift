//
//  LoginViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var login = LoginModel(email: "", password: "")
    //@Published var userId1: String = ""
    private let loginService = LoginService()
    
    func loginUser(completion: @escaping (String?, String?)-> Void) {
        loginService.loginUser(user: login) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let loginResponse):
                    if loginResponse.error == "0" {
                        completion(loginResponse.errorText, loginResponse.error)
                    } else {
                        completion(nil, loginResponse.errorText)
                    }
                case .failure(let error):
                    completion(nil, "Hata: \(error.localizedDescription)")
                }
            }
        }
    }
}
