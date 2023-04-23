//
//  LongExpertCard.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import SwiftUI

struct ShortExpertCard: View {
    
    var ExpertData : Expert;
    
    
    // Card Component
    var buttonText : String;
    var isAvailable : Bool;
    
    var body: some View {
        
        
        VStack{
            HStack{
                if let expImage = ExpertData.imageBase64.toUIImage() {
                    Image(uiImage: expImage)
                        .scaledToFit()
                        .mask {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 62, height: 78)
                        }
                }
                
                VStack{
                    HStack(alignment: .top){
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor((isAvailable) ? .green : .red)
                            .padding(.trailing, 4)
                            .padding(.bottom, 1)
                        
                        Text("\(ExpertData.name)")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    
                    HStack {
                        Image(systemName: "cross.case.fill")
                        Text("\(ExpertData.longExp) Years")
                            .font(.system(size: 12))
                        
                    }
                    .frame(width: 77, height: 22)
                    .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                    .foregroundColor(AppColor.grayOpacity60)
                    .background(AppColor.systemGray)
                    .cornerRadius(5)
                    
                    StarRatingView(rating: ExpertData.StarCount)
                    
                }
            }
            HStack{
                Text("Rp. \(String(format :  "%.2f", ExpertData.Price))")
                    .font(.system(size: 13, weight: .semibold))
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Text(buttonText)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    .frame(width: 70, height: 22)
                    .background(AppColor.systemPink)
                    .cornerRadius(5)
                }
            }
        }
        .frame(width: 170, height: 132)
        .padding(EdgeInsets(top: 13, leading: 5, bottom: 8, trailing: 5))
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(AppColor.systemGray, lineWidth: 2)
        )
    }
        
}

struct LongExpertCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Spacer();
            if let base64StringImage = UIImage(systemName: "person.fill")?.toBase64()
            {

                ShortExpertCard(ExpertData: Expert(name: "Peter Parker", role: "Dokter Kandungan", longExp: 5, Price: 20000, StarCount: 4.5, imageBase64: base64StringImage), buttonText: "Click", isAvailable: false)

                ShortExpertCard(ExpertData: Expert(name: "Peter Parker", role: "Dokter Kandungan", longExp: 5, Price: 20000, StarCount: 4.5, imageBase64: base64StringImage), buttonText: "Click", isAvailable: false)
            }
            Spacer();
        }.background(.white)

    }
}
