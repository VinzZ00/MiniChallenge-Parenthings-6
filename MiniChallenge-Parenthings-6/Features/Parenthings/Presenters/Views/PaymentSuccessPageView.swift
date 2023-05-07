 //
//  PaymentSuccessPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 28/04/23.
//

import SwiftUI

struct PaymentSuccessPageView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var amountInput : String
    @Binding var topUpFee : Double
    @State var navigate : Bool = false
    
    var body: some View {
        ZStack {
            NavigationView{
                NavigationLink(destination: HomeRootView()
                    .navigationBarHidden(true)
                    .toolbar(.hidden, for: .tabBar)
                               , isActive: $navigate){
                    EmptyView()
                }
            }
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
                    Text("\(Prompt.paymentContent.rupiah) \((parenthingsViewModel().getTotalAmountPaid(amount: Double(amountInput) ?? 0, fee: topUpFee)).defaultTrailingZero())")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
                }
                .padding(10)
                    
            }
            .padding(.bottom)
            .foregroundColor(.white)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                navigate = true
            }
//            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct PaymentSuccessPageView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessPageView(amountInput: .constant("0"), topUpFee: .constant(0.0))
            .environmentObject(parenthingsViewModel())
    }
}

