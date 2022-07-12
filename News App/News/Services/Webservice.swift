//
//  Webservice.swift
//  TIX News
//
//  Created by Indra Cahyadi on 26/02/22.
//

import Foundation

final class Webservice {
    
    static let shared = Webservice()
    
    func fetchNews(completion: @escaping ([Articles]? , Error?) -> Void) {
        
        let newsURL = Constants.Urls.fetchNews()
        URLSession.shared.dataTask(with: newsURL) { data, response, error in
            if let error = error {
                completion(nil, error)
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                    let articles = response.articles
                    completion(articles, nil)
                } catch let jsonErr {
                    print(jsonErr)
                }
            }
        }.resume()
    }
    
}
