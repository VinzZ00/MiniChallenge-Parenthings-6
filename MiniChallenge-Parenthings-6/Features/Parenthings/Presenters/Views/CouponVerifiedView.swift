//
//  CouponVerifiedView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

struct CouponVerifiedView: View {
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
                        .padding(.top, -8)

                    Text(Prompt.paymentContent.balanceAdded)
                        .textCase(.uppercase)
                        .padding(.top, 30)
                    
                    Text("Rp 00.000")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
                        .padding(.top, -8)

                }
                .padding(10)
                    
            }
            .padding(.bottom)
            .foregroundColor(.white)
        }
    }
}

struct CouponVerifiedView_Previews: PreviewProvider {
    static var previews: some View {
        CouponVerifiedView()
    }
}

