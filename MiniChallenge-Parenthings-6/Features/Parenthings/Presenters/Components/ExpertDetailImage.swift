//
//  ExpertDetailImage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 26/04/23.
//

import SwiftUI

struct ExpertDetailImage: View {
    
    let selectedExpert : Expert;
    
    var body: some View {
        ZStack{
            Image(uiImage:  selectedExpert.imageBase64.toUIImage() ?? UIImage(systemName: "photo.fill")!)
                .resizable()
                .scaledToFit()
                .frame(width: 357, height: 257)
            VStack{
                Spacer()
                HStack{
                    HStack(spacing: 0){
                        Circle()
                            .frame(width: 54, height: 16)
                            .foregroundColor((selectedExpert.isAvailable) ? .green : .red)
                        
                        Text("\((selectedExpert.isAvailable) ? "Online" : "Offline")")
                    }.padding(EdgeInsets(top: 4, leading: -10, bottom: 4, trailing: 4))
                        .background(.white)
                        .cornerRadius(5)
                        .offset(x : 20, y: -20)
                    Spacer();
                }
            }
        }.frame(width: 357, height: 257)
    }
}

struct ExpertDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        ExpertDetailImage(selectedExpert: Expert(id : UUID(), name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false))
    }
}
