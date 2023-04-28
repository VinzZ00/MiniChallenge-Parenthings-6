//
//  Consultation:ExpertPaymentView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 28/04/23.
//

import SwiftUI

struct ExpertPaymentView: View {
    var expert : Expert;
    
    var body: some View {
        VStack{
            CustomNavigationBar(title: "payment", enableBackButton: true)
                .padding(.bottom, 81)
            
            if expert.imageBase64.toUIImage() != nil  {
                Image(uiImage: expert.imageBase64.toUIImage()!)
            } else {
                Image(systemName: "person.fill")
            }
            
            
            Spacer()
        }.background(
            AppBackground()
        )
        .navigationBarHidden(false)
    }
}

struct Consultation_ExpertPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpertPaymentView(expert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "gobok")?.toBase64()) ?? "", isAvailable: false));
    }
}
