//
//  PaymentSuccessPage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 28/04/23.
//

import SwiftUI

struct PaymentSuccessPage: View {
    var body: some View {
        ZStack() {
            Image("BackgroundPaymentSuccess")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(50)
                
                VStack(alignment: .center) {
                    Text(Prompt.subTitle.paymentSuccess)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(Prompt.Caption.paymentSuccessCelebration)
                    
                    Text(Prompt.Info.amountPaid)
                        .padding(.top)
                    Text("Rp 00.000")
                        .font(.title)
                        .fontWeight(.bold)
                }
               
                    
            }
            .foregroundColor(.white)
        }
    }
}

struct PaymentSuccessPage_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessPage()
    }
}

