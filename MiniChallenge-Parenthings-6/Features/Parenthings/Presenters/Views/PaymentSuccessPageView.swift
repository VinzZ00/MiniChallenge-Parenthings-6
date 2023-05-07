 //
//  PaymentSuccessPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 28/04/23.
//

import SwiftUI

struct PaymentSuccessPageView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var totalTopUp : Double
    
    var body: some View {
        ZStack {
            Image("BackgroundPaymentSuccess")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Image(systemName: Prompt.Icon.checkMarkSeal)
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
                    Text("\(Prompt.paymentContent.rupiah) \(totalTopUp.defaultTrailingZero())")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
                }
                .padding(10)
                    
            }
            .padding(.bottom)
            .foregroundColor(.white)
        }
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct PaymentSuccessPageView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessPageView(totalTopUp: .constant(12))
    }
}

