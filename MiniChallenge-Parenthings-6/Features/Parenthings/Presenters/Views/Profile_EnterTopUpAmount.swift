//
//  Profile_EnterTopUpAmount.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 05/05/23.
//

import SwiftUI

struct Profile_EnterTopUpAmount: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var showInsertTopUpAmountView = false
    @Binding var amountInput : String
    
    var body: some View {
        VStack (spacing: 0){
            CustomNavigationBar(title: Prompt.Title.topUp, enableBackButton: true, enableSearchBar: false, backButton: {
                presentationMode.wrappedValue.dismiss()
            })
            
            //Sheet content
            VStack (alignment: .leading){
                
                Text(Prompt.Caption.enterTopUpAmount)
                    .font(.callout)
                
                //Text Field
                VStack {
                    HStack {
                        Text(Prompt.paymentContent.rupiah)
                        TextField(Prompt.paymentContent.defaultAmount, text: $amountInput)
                            .keyboardType(.numberPad)
                    }
                    .padding(.leading, 10)
                    .font(.system(size: 22, weight: .bold))
                   
                    
                    Divider()
                        .background(.black)
                }
                .bold()
                .padding(.top)
            }
            .padding(.top, 20)
            .padding(.horizontal, 25)
            
            Spacer()
            
            //Button Continue
            NavigationLink {
                //Go to top up confirmation
                Profile_TopUpConfirmation(amountInput: $amountInput)
                    .navigationBarHidden(true)
                
            } label: {
                Text(Prompt.Button.continueProcess)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
            }
            .onTapGesture(perform: {showInsertTopUpAmountView.toggle()})
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .background(AppColor.paymentBlueTextColor)
            .buttonStyle(.borderless)
        }
        .background(AppBackground())
//        .blur(radius: showInsertTopUpAmountView ? 2 : 0)
//        .animation(.easeOut(duration: 0.2), value: showInsertTopUpAmountView)
        
    }
}

struct Profile_EnterTopUpAmount_Previews: PreviewProvider {
    static var previews: some View {
        Profile_EnterTopUpAmount(amountInput: .constant("0"))
            .environmentObject(parenthingsViewModel())

    }
}
