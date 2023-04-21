//
//  LongCardView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import SwiftUI

struct LongCardView: View {
    
    
    //  Expert Data
    var ExpertData : ExpertViewModel;
    
    
    // Card Component
    var buttonText : String;
    var isAvailable : Bool;
    
    
    
    
    var body: some View {
        VStack{
            HStack{
                if let data = Data(base64Encoded: ExpertData.imageBase64, options: .ignoreUnknownCharacters) {
                    if let image = UIImage(data: data) {
                        Image(uiImage: image)
//                        Image("UniversalPlaceHolder")
                            .mask(
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 67, height: 84)
                            )
                            .padding(.trailing, 24)
                            
                    }
                }
                VStack(alignment: .leading) {
                    HStack {
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor((isAvailable) ? .green : .red)
                            .padding(.trailing, 4)
                            .padding(.bottom, 1)
                        Text("\(ExpertData.name)")
                    }
                    
                    Text("\(ExpertData.role)")
                        .font(.system(size : 12))
                        .foregroundColor(AppColor.grayOpacity60)
                        .padding(.bottom, 4)
                    
                    HStack {
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
                        
                        Spacer()
                        Text("Rp. \(String(format :  "%.2f", ExpertData.Price))")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    
                    HStack {
                        StarRatingView(rating: ExpertData.StarCount)
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
                Spacer()
            }.padding(EdgeInsets(top: 13, leading: 10, bottom: 11, trailing: 12))
        }
        .background(.white)
        .cornerRadius(15)
        .border(AppColor.systemGray)
        .frame(width: 357)
    }
}

struct LongCardView_Previews: PreviewProvider {
    static var previews: some View {
            VStack{
                Spacer();
                if let image = UIImage(systemName: "person.fill") {
                    if let imageData = image.jpegData(compressionQuality: 1.0) {
                        let base64StringImage = imageData.base64EncodedString()
                        
                        LongCardView(ExpertData: ExpertViewModel(name: "Peter Parker", role: "Dokter Kandungan", longExp: 5, Price: 20000, StarCount: 4.5, imageBase64: base64StringImage), buttonText: "Click", isAvailable: false)
                    }
                }
                Spacer();
            }.background(.white)
        
    }
}
