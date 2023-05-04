//
//  LongArticleCardView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct LongArticleCard: View {
    
    var ExpertData : Expert;
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
    // Card Component
    var buttonText : String;
    
    var body: some View {
        
        VStack(alignment: .leading){
            if let expImage = ExpertData.imageBase64.toUIImage() {
                Image(uiImage: expImage)
                    .mask {
                        RoundedRectangle(cornerRadius: 15)
                    }
            }
            
            Text("#Depresi")
                .font(.system(size: 13,weight: .semibold))
                .foregroundColor(.cyan)
            
            Text("Anak Depresi? Lakukan 10 Hal Berikut")
                .font(.system(size: 22,weight: .bold))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 30)

        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
        .aspectRatio(16/9,contentMode: .fit)
        .background(.white)
    }
        
}

struct LongArticleCard_Preview: PreviewProvider {
    
    static var previews: some View {
        VStack{
            Spacer();
            if (UIImage(systemName: "person.fill")?.toBase64()) != nil
            {

                LongArticleCard(ExpertData: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "ParentingPlaceHolder")?.toBase64()) ?? "", isAvailable: false), buttonText: "Click")

            }
            Spacer();
        }.background(.white)

    }
}
