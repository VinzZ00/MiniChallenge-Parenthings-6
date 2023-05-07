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
                .foregroundColor(AppColor.textCyanColor)
            
            Text(articleData.title)
                .font(.system(size: 22,weight: .bold))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 30)
                .foregroundColor(.black)


        }
        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
        .frame(width: UIScreen.screenWidth)
        .background(.white)
    }
        
}

struct LongArticleCard_Preview: PreviewProvider {
    
    static var previews: some View {
        VStack{
            Spacer();
          
            LongArticleCard(articleData: ArticleModel().sampleData(), buttonText: "Click")

            
            Spacer();
        }.background(.white)

    }
}
