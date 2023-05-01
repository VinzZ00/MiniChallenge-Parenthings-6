//
//  TransactionDetailViewComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 30/04/23.
//

import SwiftUI

struct TransactionDetailViewComponent: View {
    
    var transactionDetail : ConsultationTransaction;
    
    var body: some View {
        VStack{
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
                    
                    Text("Rp. \(String(format: "%.2f", transactionDetail.expert.price))")
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
            
        }
    }
}

struct TransactionDetailViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailViewComponent(transactionDetail: ConsultationTransaction(expert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false) , TransactionDate: Date(), payWith: .Parenthing))
    }
}
