//
//  HomePageResponse.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation

struct homePage: Codable {
    let error: String
    let errorText: String
    let response: homepageData
}


