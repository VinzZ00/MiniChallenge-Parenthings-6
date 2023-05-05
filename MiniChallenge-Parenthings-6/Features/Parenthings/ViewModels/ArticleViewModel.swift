//
//  ArticleViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 05/05/23.
//

import Foundation

class ArticleViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    @Published var articles: [ArticleModel] = []
  
    
    func getArticle(){
        
        isLoading = true
        errorMessage = nil
        isError = false
        do {
            articles = try JsonFileOpener().openArticleFile()
        }catch{
            errorMessage = error.localizedDescription
            print(errorMessage)
        }
        isLoading = false
        isError = errorMessage != nil
    }
    
    
}
