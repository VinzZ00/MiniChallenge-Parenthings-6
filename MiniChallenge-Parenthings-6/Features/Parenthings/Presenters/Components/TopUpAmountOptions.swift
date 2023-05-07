//
//  TopUpAmountOptions.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 07/05/23.
//


import SwiftUI

struct TopUpAmountOptions: View {
    @EnvironmentObject var viewModel : parenthingsViewModel
    @Binding var amountInput: String
    @State var isSelected: Bool = false
    @State var indexSelected : Int = 0
    
    func setAllFalseExcept(index : Int) {
        for i in 0...5 {
            if i == index {
                viewModel.amountTypeStatus[i] = true
                continue
            }
            viewModel.amountTypeStatus[i] = false
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TopUpAmountComponent(indexSelected: 0, amountIcon: Prompt.Icon.amount1, amount: 20000)
                .onTapGesture {
                    indexSelected = 0
                    viewModel.amountTypeStatus[indexSelected].toggle()

                    if viewModel.amountTypeStatus[indexSelected] {
                        setAllFalseExcept(index: indexSelected)
                        viewModel.topUpAmount = 20000
                    }
                }
                
                Spacer()
                
                TopUpAmountComponent(indexSelected: 1, amountIcon: Prompt.Icon.amount2, amount: 40000)
                .onTapGesture {
                    indexSelected = 1
                    viewModel.amountTypeStatus[indexSelected].toggle()

                    if viewModel.amountTypeStatus[indexSelected] {
                        setAllFalseExcept(index: indexSelected)
                        viewModel.topUpAmount = 40000
                    }

                }
                
                Spacer()
                
                TopUpAmountComponent(indexSelected: 2, amountIcon: Prompt.Icon.amount3, amount: 50000)
                .onTapGesture {
                    indexSelected = 2
                    viewModel.amountTypeStatus[indexSelected].toggle()

                    if viewModel.amountTypeStatus[indexSelected] {
                        setAllFalseExcept(index: indexSelected)
                        viewModel.topUpAmount = 50000
                    }
                }
            }
            HStack {
                TopUpAmountComponent(indexSelected: 3, amountIcon: Prompt.Icon.amount4, amount: 200000)
                .onTapGesture {
                    indexSelected = 3
                    viewModel.amountTypeStatus[indexSelected].toggle()

                    if viewModel.amountTypeStatus[indexSelected] {
                        setAllFalseExcept(index: indexSelected)
                        viewModel.topUpAmount = 200000
                    }
                }
                
                Spacer()
                
                TopUpAmountComponent(indexSelected: 4, amountIcon: Prompt.Icon.amount5, amount: 300000)
                .onTapGesture {
                    indexSelected = 4
                    viewModel.amountTypeStatus[indexSelected].toggle()

                    if viewModel.amountTypeStatus[indexSelected] {
                        setAllFalseExcept(index: indexSelected)
                        viewModel.topUpAmount = 300000
                    }

                }
                
                Spacer()
                
                TopUpAmountComponent(indexSelected: 5, amountIcon: Prompt.Icon.amount6, amount: 500000)
                .onTapGesture {
                    indexSelected = 5
                    viewModel.amountTypeStatus[indexSelected].toggle()

                    if viewModel.amountTypeStatus[indexSelected] {
                        setAllFalseExcept(index: indexSelected)
                        viewModel.topUpAmount = 500000
                    }
                }
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
        TopUpAmountOptions(amountInput: .constant("0"), indexSelected: 0)
            .environmentObject(parenthingsViewModel())
    }
}
