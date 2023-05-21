//
//  MyProfileResponse.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 17.05.2023.
//

import Foundation
struct firstResponse {
    let error: String
    let errorText: String
    let response: [secondResponse]
}
struct secondResponse{
    let userInfo: [thirdResponse]
    let quotations: [Any?]
    let scanIndex: Int
}
struct thirdResponse{
    let id: Int
    let email: String
    let password:String
    let namesurname: String
    let createDate: String
    let photo: NSNull?
    let username: NSNull?
    let amIfollow: Int
    let followerCount: Int
    let followCount: Int
    let quoteLikes: Int
    let qouteSoundLikes: Int
    let likeCount: Int
}
