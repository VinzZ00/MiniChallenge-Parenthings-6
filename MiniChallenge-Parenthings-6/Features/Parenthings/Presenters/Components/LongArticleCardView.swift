//
//  LongArticleCardView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct LongArticleCard: View {
    
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

            
            Text(articleData.tag)
                .font(.system(size: 13,weight: .semibold))
                .foregroundColor(.cyan)
            
            Text(articleData.title)
                .font(.system(size: 22,weight: .bold))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 30)

        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        .frame(width: UIScreen.screenWidth)
        .background(.white)
    }
        
}

struct LongArticleCard_Preview: PreviewProvider {
    
    static var previews: some View {
        VStack{
            Spacer();
            if (UIImage(systemName: "person.fill")?.toBase64()) != nil
            {

                LongArticleCard(articleData: ArticleModel().sampleData(), buttonText: "Click")

            }
            Spacer();
        }.background(.white)

    }
}
