//
//  ShortArticleCardView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ShortArticleCard: View {
    
    var ExpertData : Expert;
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
    // Card Component
    var buttonText : String;
    
    var body: some View {
        
        
        VStack{
            if let expImage = ExpertData.imageBase64.toUIImage() {
                Image(uiImage: expImage)
                    .resizable()
                    .scaledToFit()
                    .mask {
                        RoundedRectangle(cornerRadius: 15)
                    }
                  
            }
            
        }
        .aspectRatio(16/9,contentMode: .fit)
        .frame(width: UIScreen.screenWidth / 2)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .background(.white)
       
    }
        
}

struct ShortArticleCard_Preview: PreviewProvider {
    
    static var previews: some View {
        VStack{
            Spacer();
            if (UIImage(systemName: "person.fill")?.toBase64()) != nil
            {

                ShortArticleCard(ExpertData: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "ParentingPlaceHolder")?.toBase64()) ?? "", isAvailable: false), buttonText: "Click")

            }
            Spacer();
        }.background(.white)

    }
}
