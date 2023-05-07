//
//  LazyVGridPaymentType.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 29/04/23.
//

import SwiftUI



struct LazyVGridPaymentType: View {
    
    var typePayment : TypePayment
    @State var typeState : Bool = false;
    var transactionDetail : ConsultationTransaction
    var currentUser : User;
    var paymentLogo : Image;
    var description : String;
    var iscomingSoon : Bool;
    
    
    var body: some View {
        HStack {

            paymentLogo
                .resizable()
                .scaledToFit()
        }
        .frame(width: 90.44, height: 22)
            .padding(.top, 10)
            .padding(.leading, 60)
//        "\((transactionDetail.totalPrice > currentUser.balanceParenting) ? "Not Enough Balance : Rp. " : "Parenting Balance : Rp. ") \(String(format: "%.2f", currentUser.balanceParenting))"
        
        VStack(alignment: .leading) {
            if iscomingSoon {
                Text("\(description) Coming Soon !!")
                .frame(width: 220)
                .font(.system(size : 15))
                .padding(.leading, 30)
                .padding(.top, 10)
                .foregroundColor(.red)
                
                
            } else {
                Text("\(description)")
                .frame(width: 220)
                .font(.system(size : 15, weight: .bold))
                .padding(.leading, 30)
                .padding(.top, 10)
//                .foregroundColor( (transactionDetail.totalPrice > currentUser.balanceParenting) ? Color.red : Color.black )
            }
        }
        
    }
}

struct LazyVGridPaymentType_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: [GridItem(.fixed(59.77) ),GridItem(.fixed(240)),GridItem(.flexible()),GridItem(.flexible())]){
            LazyVGridPaymentType(typePayment: .Parenthing, transactionDetail: ConsultationTransaction(expert: Expert(id : UUID(), name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), TransactionDate: Date(), payWith: .Parenthing), currentUser: User(name: "Elvin", balanceParenting: 2000), paymentLogo: Image("LogoParenthing"), description: "testing", iscomingSoon: true);
            }
        .padding(.horizontal, 16)
    }
}
