//
//  HomePageResponse.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 11.05.2023.
//

import Foundation

struct homeResponse: Decodable{
    let items: [homePage]
    let scanIndex: Int
}
