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
    var backButton : () -> Void;
    var body: some View {
        VStack{
            CustomNavigationBar(title: Prompt.Title.consultationDetail, enableBackButton: true, backButton: self.backButton)
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
                    .padding(.bottom, 20)
                horizontalLine();
                
                HStack(spacing: 0){
                    AsyncImage(url: URL(string: expert.imageBase64 ?? "")) { image in
                        image
                            .resizable()
                            .frame(width: 63, height: 63)
                            .padding(EdgeInsets(top: 14, leading: 28, bottom: 10, trailing: 24))

                    } placeholder: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 63, height: 63)
                            .padding(EdgeInsets(top: 14, leading: 28, bottom: 10, trailing: 24))

                        
                    }
                   
                    
                    VStack(alignment: .leading, spacing: 0){
                        Spacer();
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
                                .font(.system(size: 10))
                            
                        }
                        .frame(width: 77, height: 22)
                        .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                        .foregroundColor(AppColor.grayOpacity60)
                        .background(AppColor.systemGray)
                        .cornerRadius(5)
                        
                        StarRatingView(rating: expert.starCount)
                            .padding(.top, 4)
                        
                        Spacer()
                    }.frame(height: 85)
                    Spacer(); //Spacer HStack
                }
                
                horizontalLine();
                
                TransactionDetailViewComponent(transactionDetail: transactionDetail
                )
                .padding(.bottom, 35)
                
                HStack{
                    
                    switch transactionDetail.payWith{
                    case .Parenthing :
                        Text("Pay with Parenthing")
                            .font(.system(size : 15))
                            .foregroundColor(AppColor.paymentGrayTextColor)
                    case .GoPay:
                        Text("Pay with Gopay")
                            .font(.system(size : 15))
                            .foregroundColor(AppColor.paymentGrayTextColor)
                    case .Ovo:
                        Text("Pay with Ovo")
                            .font(.system(size : 15))
                            .foregroundColor(AppColor.paymentGrayTextColor)
                    case .Dana:
                        Text("Pay with Dana")
                            .font(.system(size : 15))
                            .foregroundColor(AppColor.paymentGrayTextColor)
                    case .BankTransfer :
                        Text("pay by Bank Transfer")
                            .font(.system(size : 15))
                            .foregroundColor(AppColor.paymentGrayTextColor)
                    }
                    
                    Spacer()
                    Text("Rp.\(transactionDetail.totalPrice)")
                        .font(.system(size : 15))
                        .foregroundColor(AppColor.paymentGrayTextColor)
                }.padding(.horizontal, 16)
                
                
                            
                
                Spacer();
                
                
            }.offset(y : -46)
            VStack{
                Button{
                    
                } label: {
                    VStack{
                        Text(Prompt.Button.reChatExpert)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold
                                         ))
                    }
                    .frame(width: 357, height: 53)
                    .background(AppColor.paymentBlueTextColor)
                    .cornerRadius(15)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 18)
                    
                }
            }
            .frame(width: 393, height: 83)
            .background(.black.opacity(0.05))
            
                
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

//struct ConsultationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConsultationDetailView(expert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false),transactionDetail: ConsultationTransaction(expert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), TransactionDate: Date(), payWith: .Parenthing))
//    }
//}
