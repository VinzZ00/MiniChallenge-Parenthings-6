//
//  PaymentSuccessPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 28/04/23.
//

import SwiftUI

struct PaymentSuccessPageView: View {
    var body: some View {
        ZStack {
            Image("BackgroundPaymentSuccess")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    .padding([.top, .horizontal], 50)
                    .padding(.bottom, 10)
                
                VStack(alignment: .center) {
                    Text(Prompt.subTitle.paymentSuccess)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(Prompt.Caption.paymentSuccessCelebration)
                    
                    Text(Prompt.paymentContent.amountPaid)
                        .padding(.top, 40)
                    Text("Rp 00.000")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
                }
                .padding(10)
                    
            }
            .padding(.bottom)
            .foregroundColor(.white)
        }
    }
}

struct PaymentSuccessPageView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessPageView()
    }
}

