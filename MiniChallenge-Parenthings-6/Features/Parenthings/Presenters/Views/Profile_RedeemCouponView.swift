//
//  Profile_RedeemCouponView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

struct Profile_RedeemCouponView: View {
    
    @State var couponTextfieldText: String = ""
    
    var body: some View {
        
//        NavigationView {
            VStack (spacing: 0){
                CustomNavigationBar(title: Prompt.Title.redeemCoupon, enableBackButton: false, enableSearchBar: false, backButton: {} )
                
                
                //Contents
                VStack (alignment: .leading) {
                    Image(Prompt.Icon.promoCode)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 60, maxHeight: 60)
                    VStack (alignment: .leading){
                        Text(Prompt.subTitle.haveCouponCode)
                            .font(.system(size: 22, weight: .bold))
                        Text(Prompt.Caption.enterCouponGuide)
                            .font(.callout)
                    }
                    .padding(.top, 10)
                    
                    VStack {
                        TextField(Prompt.paymentContent.redeemCode, text: $couponTextfieldText)
                            .padding(.leading, 10)
                        
                        Divider()
                            .background(.black)
                    }
                    .padding(.top)
                }
                .padding(.horizontal, 25)
                .offset(y: -10)
                
                Spacer()
                
                //Button
                VStack {
                    Button {
                        
                    } label: {
                        Text(Prompt.Button.verifyCode)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(0)
                            .padding(.vertical, 15)

                    }
                    .buttonStyle(.borderless)
                    .background(AppColor.paymentBlueTextColor)
                    .foregroundColor(.white)
                    .font(.title2)
                }
            }
            .background(AppBackground())
    }
}

struct Profile_RedeemCouponView_Previews: PreviewProvider {
    static var previews: some View {
        Profile_RedeemCouponView()
    }
}
