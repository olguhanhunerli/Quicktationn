//
//  HomePageModel.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation

struct homepageData: Codable {
    let quotations: [homePagee]
    let scanIndex: Int
}

struct homePagee: Codable, Identifiable {
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
