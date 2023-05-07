//
//  PaymentTypeOptions.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 07/05/23.
//

import SwiftUI

struct PaymentTypeOptions: View {
    @EnvironmentObject var paymentTypeViewModel : PaymentTypeViewModel
    @Binding var topUpFee : Double
    @Binding var selectedPaymentType : TypePayment
    @Binding var showInsertTopUpAmountView : Bool
    
    var body: some View {
        VStack {
            PaymentTypeComponent(topUpFee: $topUpFee, selectedPaymentType: $selectedPaymentType, showInsertTopUpAmountView: $showInsertTopUpAmountView, paymentType: .Parenthing)
            PaymentTypeComponent(topUpFee: $topUpFee, selectedPaymentType: $selectedPaymentType, showInsertTopUpAmountView: $showInsertTopUpAmountView, paymentType: .BankTransfer)
            PaymentTypeComponent(topUpFee: $topUpFee, selectedPaymentType: $selectedPaymentType, showInsertTopUpAmountView: $showInsertTopUpAmountView, paymentType: .GoPay)
            PaymentTypeComponent(topUpFee: $topUpFee, selectedPaymentType: $selectedPaymentType, showInsertTopUpAmountView: $showInsertTopUpAmountView, paymentType: .Dana)
            PaymentTypeComponent(topUpFee: $topUpFee, selectedPaymentType: $selectedPaymentType, showInsertTopUpAmountView: $showInsertTopUpAmountView, paymentType: .Ovo)
        }
    }
}

struct PaymentTypeOptions_Previews: PreviewProvider {
    static var previews: some View {
        PaymentTypeOptions(topUpFee: .constant(0), selectedPaymentType: .constant(TypePayment.Parenthing), showInsertTopUpAmountView: .constant(false))
            .environmentObject(PaymentTypeViewModel())
    }
}
