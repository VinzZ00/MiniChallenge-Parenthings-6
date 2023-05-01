//
//  ConsultationDetailView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 30/04/23.
//

import SwiftUI

struct ConsultationDetailView: View {
    
    @State var ratingScore : Int = 0;
    var expert : Expert
    var transactionDetail : ConsultationTransaction
    
    var body: some View {
        VStack{
            CustomNavigationBar(title: Prompt.Title.consultationDetail, enableBackButton: true)
            VStack{
                ZStack(alignment: .leading){
                 TopRoundedRectangle(cornerRadius: 10)
                        .foregroundColor(AppColor.systemGray)
                    VStack (alignment: .leading, spacing: 0){
                        Text("Thanks for using ParenThings")
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.top, 13)
                        Text("Hope you've solved the problem. See you next time!")
                            .font(.system(size: 17, weight: .regular))
                        Spacer()
                    }.padding(.leading, 18)
                }.frame(height: 92)
                
                VStack{
                    Text("How was the expert?\n(1 is Disappointing, 5 is awesome)")
                        .multilineTextAlignment(.center)
                        .font(.system(size : 20, weight: .bold))
                }.padding(.top, 23)
                
                StarRatingButton(rating: $ratingScore)
                    .animation(.linear(duration: 0.3), value: ratingScore)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                
                horizontalLine();
                
                HStack(spacing: 0){
                    if expert.imageBase64.toUIImage() != nil  {
                        Image(uiImage: expert.imageBase64.toUIImage()!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 67, height: 84)
                            .padding(EdgeInsets(top: 14, leading: 28, bottom: 10, trailing: 24))
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 67, height: 84)
                            .padding(EdgeInsets(top: 14, leading: 28, bottom: 10, trailing: 24))
                    }
                    VStack(alignment: .leading, spacing: 0){
                        Text("\(expert.name)")
                            .font(.system(size: 16, weight: .semibold))
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                            .minimumScaleFactor(0.75)
                            .padding(.bottom, 2)
                        
                        Text("\(expert.role)")
                            .font(.system(size : 12))
                            .foregroundColor(AppColor.grayOpacity60)
                            .padding(.bottom, 4)
                        
                        HStack {
                            Image(systemName: "cross.case.fill")
                            Text("\(expert.longExp) Years")
                                .font(.system(size: 12))
                            
                        }
                        .frame(width: 77, height: 22)
                        .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                        .foregroundColor(AppColor.grayOpacity60)
                        .background(AppColor.systemGray)
                        .cornerRadius(5)
                        
                        
                        Spacer()
                    }.frame(height: 85)
                    Spacer(); //Spacer HStack
                }
                
                TransactionDetailViewComponent(transactionDetail: transactionDetail
                )
                
                
                            
                
                Spacer();
            }.offset(y : -46)
            
            Spacer()
        }.background(AppBackground())
    }
}

private struct horizontalLine : View {

    var body : some View {
        Rectangle()
            .foregroundColor(AppColor.grayLightColor)
            .frame(height: 2)
            .padding(.horizontal, 18)
    }
}

struct ConsultationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationDetailView(expert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false),transactionDetail: ConsultationTransaction(expert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), TransactionDate: Date(), payWith: .Parenthing))
    }
}
