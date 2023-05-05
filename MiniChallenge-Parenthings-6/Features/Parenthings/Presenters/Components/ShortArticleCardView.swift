//
//  ShortArticleCardView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ShortArticleCard: View {
    var articleData : ArticleModel;
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
    // Card Component
    var buttonText : String;
    
    var body: some View {
        
        
        VStack(alignment: .leading){

            Image(uiImage: UIImage(named: articleData.image)!)
                    .resizable()
                    .scaledToFit()
                    .mask {
                        RoundedRectangle(cornerRadius: 15)
                    }
                    .aspectRatio(16/9,contentMode: .fit)

                  
            
            Text(articleData.title)
                .font(.system(size: 12,weight: .bold))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 28)
                .foregroundColor(.black)

            
        }
        .frame(width: UIScreen.screenWidth / 2)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .background(.white)
       
    }
        
}

struct ShortArticleCard_Preview: PreviewProvider {
    
    static var previews: some View {
        VStack{
            Spacer();
          
                ShortArticleCard(articleData: ArticleModel().sampleData(), buttonText: "Click")

            
            Spacer();
        }.background(.white)

    }
}
