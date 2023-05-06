//
//  Profile_TopUpConfirmation.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

struct Profile_TopUpConfirmation: View {
    @Environment(\.presentationMode) var presentationMode

    var profileBalance = 0
    @Binding var amountInput : String

    var body: some View {
        
//        NavigationView {
            VStack (spacing: 0){
                CustomNavigationBar(title: Prompt.Title.topUpConfirmation, enableBackButton: true, enableSearchBar: false, backButton: {                    presentationMode.wrappedValue.dismiss()
                } )
                
                
                //Contents
                VStack (alignment: .leading) {
                    
                    Text(Prompt.subTitle.topUpAmount)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.gray)
        
                    HStack {
                        Text("\(Prompt.paymentContent.rupiah)")
                        Text("\(amountInput)")
                    }
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 3)
                    .padding(.leading, 10)
                    
                    
                    Divider()
                        .background(.black)
                    
                    //Top up to
                    HStack (alignment: .bottom) {
                        Text(Prompt.paymentContent.topUpTo)
                            .font(.callout)
                            .bold()
                            .foregroundColor(.gray)
                        LogoComponent()
                            .frame(maxHeight: 18)
                            .frame(alignment: .leading)
                            .padding(.bottom, 2)
                    }
                    
                    //Top up detail title
                    Text(Prompt.paymentContent.topUpDetail)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                    
                    //Top up details
                    VStack (alignment: .leading){
                        Group {
                            HStack {
                                Text(Prompt.paymentContent.topUpAmount)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                Spacer()
                                HStack {
                                    Text("\(Prompt.paymentContent.rupiah)")
                                    Text("\(amountInput)")
                                }
                                .font(.callout)
                                .bold()
                            }
                            .foregroundColor(.gray)
                            
                            HStack {
                                Text(Prompt.paymentContent.topUpFee)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text(Prompt.Caption.selectTopUpMethodGuide)
                                    .font(.callout)
                                    
//                                Text("Rp \(profileBalance)")
//                                    .font(.callout)
//                                    .bold()
                            }
                            .foregroundColor(.gray)
                        }
                        .padding(.top, -5)
                        
                    }
                    .padding(.bottom, 6)
                    
                    Divider()
                        .background(.black)
                    
                    HStack {
                        Text(Prompt.paymentContent.total)
                            .font(.system(size: 17, weight: .none))
//                            .foregroundColor(.gray)
                            .bold()
                        Spacer()
                        Text("Rp \(profileBalance)")
                            .font(.callout)
                            .bold()
                    }
                    
                }
                .padding(.horizontal, 25)
                
                Spacer()
                
                BottomConfirmationComponent()
            }
            .background(AppBackground())
    }
}

struct Profile_TopUpConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        Profile_TopUpConfirmation(amountInput: .constant("0"))
            .environmentObject(parenthingsViewModel())
    }
}
