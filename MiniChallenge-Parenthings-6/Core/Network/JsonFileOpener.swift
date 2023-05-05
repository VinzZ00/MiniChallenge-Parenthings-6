//
//  JsonFileOpener.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 02/05/23.
//

import Foundation

struct JsonFileOpener {
    
    func openArticleFile() throws -> [ArticleModel]  {
        if let path = Bundle.main.path(forResource: "article", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                let json = try JSONSerialization.data(withJSONObject: jsonResult )
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let articleData = try decoder.decode([ArticleModel].self, from: json)
                 return articleData
        }
        
        return []
    }
    
}
