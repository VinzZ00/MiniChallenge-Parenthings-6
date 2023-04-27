//
//  SwiftUIView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 26/04/23.
//

import SwiftUI

struct ExpertGridView: View {
    
//    var c1r1 : Expert;
//    var c2r1 : Expert?
//    var c1r2 : Expert?
//    var c2r2 : Expert?
    
    var experts : [Expert]
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack(alignment: .center) {
            LazyVGrid(columns: columns) {
                
                ForEach(experts, id : \.self) { expert in
                    if let exp = expert {
                        ShortExpertCard(ExpertData: exp, buttonText: Prompt.Button.chat)
                            .clipShape(RoundedRectangle(cornerRadius: 15));
                    }
                }
                
    //            if let exp1 = experts[0] {
    //                ShortExpertCard(ExpertData: exp1, buttonText: Prompt.Button.chat)
    //                    .clipShape(RoundedRectangle(cornerRadius: 15));
    //            }
    //
    //            if let exp2 = experts[1]{
    //                ShortExpertCard(ExpertData: exp2, buttonText: Prompt.Button.chat)
    //                    .clipShape(RoundedRectangle(cornerRadius: 15))
    //            }
    //
    //            if let exp3 = experts[2] {
    //                ShortExpertCard(ExpertData: exp3, buttonText: Prompt.Button.chat)
    //                    .clipShape(RoundedRectangle(cornerRadius: 15))
    //            }
    //
    //
    //            if let exp4 = experts[3] {
    //                ShortExpertCard(ExpertData: exp4, buttonText: Prompt.Button.chat)
    //                    .clipShape(RoundedRectangle(cornerRadius: 15))
    //            }
                
            }
            .padding()
            .frame(height: 300);
        }
        
    }
}

struct ExpertGridView_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            ExpertGridView(experts: [
            
                Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false),
                
                Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false),
                
                Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false),
                
                Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false)
                
            ])
            
            
        }
    }
}
