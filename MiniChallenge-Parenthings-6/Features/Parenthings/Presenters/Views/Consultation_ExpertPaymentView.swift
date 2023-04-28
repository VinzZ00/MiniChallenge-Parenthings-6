//
//  Consultation:ExpertPaymentView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 28/04/23.
//

import SwiftUI

struct ExpertPaymentView: View {
    var expert : Expert;
    var transactionDetail : ConsultationTransaction;
    @State var selectedValue = 0;
    
    
    init(expert : Expert) {
        self.expert = expert
        self.transactionDetail = ConsultationTransaction(expert: expert)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                
                if expert.imageBase64.toUIImage() != nil  {
                    Image(uiImage: expert.imageBase64.toUIImage()!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 63, height: 79)
                        
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 63, height: 79)
                }
                
                VStack (alignment: .leading){
                    Text(expert.name)
                        .font(.system(size: 22, weight: .bold))
                    Text(expert.role)
                        .font(.system(size : 15, weight: .regular))
                        .foregroundColor(AppColor.paymentGrayTextColor)
                }
                
                Spacer()
            }
            .padding(.top, 100)
            .padding()
            
            
            
            VStack(alignment: .leading, spacing: 6) {
                HStack{
                    Text(Prompt.paymentContent.expertFee)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(AppColor.paymentGrayTextColor)
                    +
                    Text(" \(Prompt.paymentContent.defaultDuration)")
                        .font(.system(size : 15, weight: .bold))
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    Text("Rp. \(String(format: "%.2f", expert.price))")
                }
                .padding(.horizontal, 16)
                
                HStack {
                    Text(Prompt.paymentContent.adminFee)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(AppColor.paymentGrayTextColor)
                    
                    Spacer()
                    
                    Text("Rp. \(String(format: "%.2f", transactionDetail.adminFee))")
                }.padding(.horizontal, 16)
            }
            
            HStack(spacing: 0) {
                Text(Prompt.paymentContent.totalPayment)
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
                
                Text("Rp. \(String(format: "%.2f", transactionDetail.totalPrice))")
                    .font(.system(size: 15, weight: .bold))
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            
            
            
            Text(Prompt.paymentContent.choosePayment)
                .font(.system(size : 15, weight: .bold))
                .padding(.leading, 16)
                .padding(.top, 34)
                .padding(.bottom, 17)
            
            CustomPicker(CustomPickerList: [Prompt.paymentContent.electronicMoney, Prompt.paymentContent.CC_DC], selectedValue: self.$selectedValue)
                .padding(.horizontal, 16)
                
            
            Spacer()
        }.background(
            VStack
            {
                CustomNavigationBar(title: Prompt.Title.payment, enableBackButton: true)
                    .padding(.bottom, 81)
                Spacer()
            }.background(
            AppBackground()
            )
        )
        .navigationBarHidden(false)
        
        
        
        
        
    
        
        
        
    }
}

struct Consultation_ExpertPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpertPaymentView(expert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "gobok")?.toBase64()) ?? "", isAvailable: false));
    }
}
