//
//  LongExpertCard.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import SwiftUI

struct ShortExpertCard: View {
    
    var ExpertData : Expert;
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
    // Card Component
    var buttonText : String;
    
    var body: some View {
        
        
        VStack{
            HStack(spacing:20){
                //                if let expImage = ExpertData.imageBase64.toUIImage() {
                //                    Image(uiImage: expImage)
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 62, height: 100)
                //                        .mask {
                //                            RoundedRectangle(cornerRadius: 15)
                //
                //                        }
                //                }
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: ExpertData.imageBase64 ?? "")) { image in
                        image
                            .resizable()
                            .frame(width: 64, height: 64)
                            .mask(
                                RoundedRectangle(cornerRadius: 15)
                            )
                        
                    } placeholder: {
                        Image(uiImage : UIImage(named: "UniversalPlaceHolder")!)
                            .resizable()
                            .frame(width: 64, height: 64)
                            .mask(
                                RoundedRectangle(cornerRadius: 15)
                            )
                    }
                }
                
                
                VStack(alignment: .leading){
                    HStack(alignment: .top){
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor((ExpertData.isAvailable) ? .green : .red)
                            .padding(.trailing, 4)
                            .padding(.bottom, 1)
                        
                        Text("\(ExpertData.name.capitalized)")
                            .font(.system(size: 16, weight: .semibold))
                            .lineLimit(2)
                            .foregroundColor(AppColor.titleColor)
                            .fixedSize(horizontal: false, vertical: true)
                            .minimumScaleFactor(0.75)
                    }
                    
                    HStack {
                        Image(systemName: "cross.case.fill")
                        Text("\(ExpertData.longExp) Years")
                            .font(.system(size: 10))
                        
                    }
                    .frame(width: 77, height: 22)
                    .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                    .foregroundColor(AppColor.grayOpacity60)
                    .background(AppColor.systemGray)
                    .cornerRadius(5)
                    
                    StarRatingView(rating: ExpertData.starCount)
                    
                }
                Spacer()
            }
            HStack{
                Text("Rp. \(String(format :  "%.2f", ExpertData.price))")
                    .font(.system(size: 13, weight: .semibold))
                Spacer()
                Button {
                    withAnimation {
                        viewModel.expertDetailIsPresented = true
                        viewModel.selectedExpert = ExpertData
                        viewModel.setSelectedExpert(userData: ExpertData)
                    }
                } label: {
                    VStack {
                        Text(buttonText)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    .frame(width: 70, height: 22)
                    .background(AppColor.paymentBlueTextColor)
                    .cornerRadius(5)
                }
            }
        }
        .frame(height: 132)
        .padding(.vertical, Prompt.Padding.paddingSmall)
        .padding(.horizontal, Prompt.Padding.paddingMedium)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(AppColor.systemGray, lineWidth: 2)
        )
    }
    
}

struct shortExpertCardPreview: PreviewProvider {
    static var previews: some View {
        VStack{
            Spacer();
            if (UIImage(systemName: "person.fill")?.toBase64()) != nil
            {
                
                ShortExpertCard(ExpertData: Expert(id : UUID(), name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), buttonText: "Click")
                
                //                ShortExpertCard(ExpertData: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), buttonText: "Click")
            }
            Spacer();
        }.background(.white)
        
    }
}
