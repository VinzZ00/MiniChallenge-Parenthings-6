//
//  Article_SearchPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ArticleSearchPage: View {
    
    var searchedArticles : [ArticleModel];
    
    var body: some View {
        List{
            ForEach(searchedArticles, id : \.self) { articles in
              
                LongArticleCard(articleData: articles, buttonText: Prompt.Button.chat)
                
                    .frame(width: UIScreen.screenWidth)
                
            }.listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .ignoresSafeArea()
        
        
    }
    
}

struct ArticleSearchPage_Previews: PreviewProvider {
    static var previews: some View {
        
        ArticleSearchPage(searchedArticles: [ArticleModel().sampleData()])
        
    }
}
