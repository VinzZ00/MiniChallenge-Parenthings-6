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
            
            VStack(alignment: .leading) {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    
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

