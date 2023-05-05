//
//  Article_SearchPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ArticleSearchPage: View {
    
    var searchedExperts : [Expert];
    
    var body: some View {
        List{
            ForEach(0..<4, id : \.self) { indx in
              
                LongArticleCard(articleData: ArticleModel().sampleData(), buttonText: Prompt.Button.chat)
                
                    .frame(width: UIScreen.screenWidth)
                
            }.listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .ignoresSafeArea()
        
        
        
        
        
    }
    
}

struct ArticleSearchPage_Previews: PreviewProvider {
    static var previews: some View {
        
        ArticleSearchPage(searchedExperts: [Expert().sampleData()])
        
    }
}
