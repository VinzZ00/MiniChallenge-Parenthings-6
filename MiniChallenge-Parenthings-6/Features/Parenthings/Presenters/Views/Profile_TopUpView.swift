//
//  Profile_TopUpView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

enum topUPType {
    case topUP1
    case topUP2
    case topUp3
}

struct Profile_TopUpView: View {
    
    @State private var showInsertTopUpAmountView = false
    @State private var amountTextfield = "0"
    @State private var isSelected = true
    
    var profileBalance = 0

    var body: some View {
        
//        NavigationView {
            VStack (spacing: 0){
                CustomNavigationBar(title: Prompt.Title.topUp, enableBackButton: false, enableSearchBar: false, backButton: {} )
                
                
                //Contents
                ZStack {
                    
//                    VStack{
//                        Spacer()
//                    }
//                    .background(.white)
                    
                    TopRoundedRectangle(cornerRadius: 12)
                        .foregroundColor(AppColor.systemGray)
                        .offset(y:-38)
                        .frame(maxHeight: 90)
                        
                    HStack {
                        VStack (alignment: .leading) {
                            //Current Balance
                            VStack (alignment: .leading, spacing : 3) {
                            
                                Image("LogoParenthing")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 120)
                                    .padding(0)
                                
                                HStack {
                                    Text(Prompt.paymentContent.balance)
                                        .foregroundColor(.gray)
                                    Text("Rp. \(profileBalance)")
                                        .bold()
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .offset(y: -39)
                    .padding(.horizontal, 20)
                    
                }
                
                //Contents
                VStack (alignment: .leading) {
                    Text(Prompt.paymentContent.chooseAmount)
                        .font(.callout)
                        .bold()
                    
                    VStack {
                        HStack {
                            TopUpAmountComponent(isSelected: $isSelected, amountIcon: Prompt.Icon.amount1, amount: 20000)
                            Spacer()
                            TopUpAmountComponent(isSelected: $isSelected, amountIcon: Prompt.Icon.amount2, amount: 50000)
                            Spacer()
                            TopUpAmountComponent(isSelected: $isSelected, amountIcon: Prompt.Icon.amount3, amount: 100000)
                        }
                        
//                        HStack {
//                            TopUpAmountComponent(amountIcon: Prompt.Icon.amount4, amount: 200000)
//                            Spacer()
//                            TopUpAmountComponent(amountIcon: Prompt.Icon.amount5, amount: 300000)
//                            Spacer()
//                            TopUpAmountComponent(amountIcon: Prompt.Icon.amount6, amount: 500000)
//                        }
                    }
                    .padding(10)
                    
                    //Button type amount
                    VStack {
                        Button {
                            // Toggle
                            showInsertTopUpAmountView.toggle()
                        } label: {
                            HStack {
                                Image(systemName: Prompt.Icon.add)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 14, maxHeight: 14)
                                
                                Text(Prompt.Button.typeTheAmount)
                                    .font(.callout)
                                    .bold()
                                    .padding(.vertical, 10)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderless)
                        .padding(8)
                        .background(AppColor.systemGray)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .font(.title2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(AppColor.grayLightColor, lineWidth: 1.5)
                        )
                        .sheet(isPresented: $showInsertTopUpAmountView) {
                            VStack {
                                //Drag indicator
                                Capsule()
                                    .fill(Color.secondary)
                                    .opacity(0.5)
                                    .frame(width: 35, height: 5)
                                    .padding(.top, 15)
                                
                                //Sheet content
                                VStack (alignment: .leading){
                                    
                                    Text(Prompt.Caption.enterTopUpAmount)
                                        .font(.callout)
                                    
                                    //Text Field
                                    VStack {
                                        TextField(Prompt.paymentContent.redeemCode, text: $amountTextfield)
                                            .keyboardType(.numberPad)
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
                                Button {
                                    showInsertTopUpAmountView.toggle()
                                } label: {
                                    Text(Prompt.Button.continueProcess)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 15)
                                }
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .background(AppColor.paymentBlueTextColor)
                                .buttonStyle(.borderless)
                            }
                            .presentationDetents([.medium])
                            
                        }
                    }
                    
                    Spacer()
                    
                    //Button continue
                    VStack {
                        Button {
                            

                        } label: {
                            Text(Prompt.Button.continueProcess)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                            
                        }
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .background(AppColor.paymentBlueTextColor)
                        .buttonStyle(.borderless)
                        .cornerRadius(15)
                    }
                }
                .offset(y: -20)
                .padding(.horizontal, 25)
                .padding(.top, 10)
            }
            .background(AppBackground())
            .blur(radius: showInsertTopUpAmountView ? 2 : 0)
            .animation(.easeOut(duration: 0.2), value: showInsertTopUpAmountView)
    }
}

struct Profile_TopUpView_Previews: PreviewProvider {
    static var previews: some View {
        Profile_TopUpView()
    }
}
