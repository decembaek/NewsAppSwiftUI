//
//  NewsAPIResponse.swift
//  NewsClone
//
//  Created by 백승규 on 7/21/24.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
