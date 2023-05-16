//
//  HomePageResponse.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation
struct homePageResponse2: Codable {
    let response: homePageResponse
    let error: String
    let errorText:String
}
struct homePageResponse: Codable {
        let quotations:  [homePage2]
        let scanIndex: Int
        
}

struct homePage2: Codable, Identifiable {
        let id: Int
        let quote_text: String
        let quote_url: String
        let stat: Int
        let userId: Int
        let createDate: String
        let username: String
        let userphoto: String?
        let likeCount: Int
        let amIlike: Int
        
}
