//
//  TopUpAmountComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

struct TopUpAmountComponent: View {
//    @Binding var isSelected: topUPType
    @Binding var isSelected: Bool
    
    var amountIcon: String
    var amount: Int
    
    var body: some View {
        VStack {
            VStack {
                Button{
                    
                } label: {
                }
                .buttonStyle(.plain)
                .cornerRadius(10)
                .frame(maxWidth: 100, maxHeight:110)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(AppColor.paymentBlueTextColor)
                        .opacity(isSelected ? 0.07: 0)
                ).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? AppColor.paymentBlueTextColor : AppColor.grayLightColor , lineWidth: 1)
                )
                .overlay(
                    ZStack {
                        if isSelected {
                            VStack (alignment: .trailing){
                                HStack {
                                  Spacer()
                                    Image(systemName: Prompt.Icon.checkMarkCircle)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 15)
                                    .padding(8)
                                    .foregroundColor(AppColor.paymentBlueTextColor)
                                }
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            Spacer()
                            
                            Image(amountIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .padding(5)
                            
                            Text("Rp \(amount)")
                                .font(.system(size: 12, weight: .bold))
                                .padding(.bottom, 5)
                        }
                        .padding(10)
                    }
                    
                )
            }
        }
    }
}

struct TopUpAmountComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopUpAmountComponent(isSelected: .constant(true), amountIcon: Prompt.Icon.amount1, amount: 199999)
    }
}
