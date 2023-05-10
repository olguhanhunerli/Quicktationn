//
//  RegisterViewModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 28.04.2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var userRegistration = RegisterPageModel()
    private let userRegistrationService = registerService()

    func registerUser(completion: @escaping (String?, String?)-> Void) {
        userRegistrationService.registerUser(user: userRegistration) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let registerResponse):
                    if let success = registerResponse.success, success {
                        completion(registerResponse.errorText, registerResponse.error)}
                    else {completion(nil, registerResponse.errorText)}
                case .failure(let error):
                    completion(nil,"Hata: \(error.localizedDescription)")
                }
            }
        }
    }
}

