//
//  HomePageModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation
struct homePage: Decodable{
        var id: Int
        var quote_text: String
        var quote_url: String
        var stat: Int
        var userId: Int
        var createDate: String
        var username: String
        var userphoto: String?
        var likeCount: Int
        var amIlike: Int
}
