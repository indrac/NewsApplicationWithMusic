//
//  Model.swift
//  TIX News
//
//  Created by Indra Cahyadi on 26/02/22.
//

import Foundation

struct NewsResponse: Decodable {
    
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

struct Articles: Decodable {
    
    let author: String?
    let title: String
    let description: String
    let urlToImage: String
}
