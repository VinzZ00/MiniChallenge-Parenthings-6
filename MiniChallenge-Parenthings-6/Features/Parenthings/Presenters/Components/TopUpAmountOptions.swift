//
//  TopUpAmountOptions.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 07/05/23.
//


import SwiftUI

struct TopUpAmountOptions: View {
    
    @Binding var amountInput: String
    @Binding var selectedAmount: topUPAmountType
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TopUpAmountComponent(selectedAmount: $selectedAmount, amountInput: $amountInput, isSelected: $isSelected, amountIcon: Prompt.Icon.amount1, amount: topUPAmountType.topUP1)
                Spacer()
                TopUpAmountComponent(selectedAmount: $selectedAmount, amountInput: $amountInput, isSelected: $isSelected, amountIcon: Prompt.Icon.amount2, amount: topUPAmountType.topUP2)
                Spacer()
                TopUpAmountComponent(selectedAmount: $selectedAmount, amountInput: $amountInput, isSelected: $isSelected, amountIcon: Prompt.Icon.amount3, amount: topUPAmountType.topUP3)
//                Spacer()
//                TopUpAmountComponent(isSelected: $isSelected, amountIcon: Prompt.Icon.amount2, amount: 50000)
//                Spacer()
//                TopUpAmountComponent(isSelected: $isSelected, amountIcon: Prompt.Icon.amount3, amount: 100000)
            }
            
//                        HStack {
//                            TopUpAmountComponent(amountIcon: Prompt.Icon.amount4, amount: 200000)
//                            Spacer()
//                            TopUpAmountComponent(amountIcon: Prompt.Icon.amount5, amount: 300000)
//                            Spacer()
//                            TopUpAmountComponent(amountIcon: Prompt.Icon.amount6, amount: 500000)
//                        }
        }
    }
}

struct TopUpAmountOptions_Previews: PreviewProvider {
    static var previews: some View {
        TopUpAmountOptions(amountInput: .constant("0"), selectedAmount: .constant(topUPAmountType.topUP1)
        )
    }
}
