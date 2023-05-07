//
//  PaymentTypeComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 07/05/23.
//

import SwiftUI

struct PaymentTypeComponent: View {
    
    @EnvironmentObject var paymentTypeViewModel : PaymentTypeViewModel
    @EnvironmentObject var viewModel : parenthingsViewModel
    
    @Binding var topUpFee : Double
    @Binding var selectedPaymentType : TypePayment
    @Binding var showInsertTopUpAmountView : Bool
    
    var paymentType: TypePayment
    
    var imageName : String {
        paymentTypeViewModel.getDetails(paymentType: paymentType).completeLogo
    }
    
    var imageText: String{
        paymentTypeViewModel.getDetails(paymentType: paymentType).name
    }
    
    var isCustom: Bool {
        paymentTypeViewModel.getDetails(paymentType: paymentType).isLogoCustom
    }
    
    
    
    var body: some View {
        VStack (alignment: .leading){
            Button {
                paymentTypeViewModel.selectedType = paymentType
                topUpFee = paymentTypeViewModel.getDetails(paymentType: paymentType).taxFee
                selectedPaymentType = paymentType
                showInsertTopUpAmountView.toggle()
            } label: {
                PaymentLabel(
                    imageName: imageName,
                    imageText: imageText,
                    isCustom: isCustom)
                .padding(.leading, 15)
            }
            .foregroundColor(.black)

            Divider()
                .background(.black)
        }
        .padding(.top, 8)
    }
}

struct PaymentTypeComponent_Previews: PreviewProvider {
    var paymentType: TypePayment = .Parenthing
    static var previews: some View {
        PaymentTypeComponent(topUpFee: .constant(0.0), selectedPaymentType: .constant(TypePayment.Parenthing), showInsertTopUpAmountView: .constant(false), paymentType: .Parenthing)
            .environmentObject(PaymentTypeViewModel())
    }
}
