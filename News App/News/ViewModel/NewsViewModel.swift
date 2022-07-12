//
//  NewsViewModel.swift
//  TIX News
//
//  Created by Indra Cahyadi on 26/02/22.
//

import Foundation


struct NewsViewModel {
    
    let author, title, description, image: String
    
    init(news: Articles) {
        self.author = news.author ?? ""
        self.title = news.title
        self.description = news.description
        self.image = news.urlToImage
    }
    
}
