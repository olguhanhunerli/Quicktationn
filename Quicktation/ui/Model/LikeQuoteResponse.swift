//
//  LikeQuoteResponse.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 16.05.2023.
//

import Foundation
struct likeResponse {
    let response: likeResponse2
    let error: String
    let errorText: String
}
struct likeResponse2 {
    var likeCount: Int
    var quoteId: Int
    var isDeleted: Int
    
}
