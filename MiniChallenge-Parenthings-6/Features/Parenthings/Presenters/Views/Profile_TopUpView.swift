//
//  Profile_TopUpView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

//Nanti taro di model
//enum topUPAmountType: String {
//   case topUP0 = "0"
//    case topUP1 = "19000"
//    case topUP2 = "49000"
//    case topUP3 = "99000"
//    case topUP4 = "199000"
//    case topUP5 = "299000"
//    case topUp6 = "499000"
//
//}

struct Profile_TopUpView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var viewModel : parenthingsViewModel;
    @State private var showInsertTopUpAmountView = false
//    @State private var amountTextfield = "0"
    @State var isSelected20 = false
    @State var isSelected50 = false
    @State var isSelected100 = false;
    
    @State private var amountInput = "0"
//    @State private var selectedAmount = topUPAmountType.topUP1
    
    var profileBalanceDefault: Double = 50_000

    var body: some View {
        
//        NavigationView {
        VStack {
            VStack (spacing: 0){
                CustomNavigationBar(title: Prompt.Title.topUp, enableBackButton: true, enableSearchBar: false, backButton: {
                    presentationMode.wrappedValue.dismiss()
                })
                
                
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
                                    Text("Rp \(viewModel.userTest?.balanceParenting.defaultTrailingZero() ?? profileBalanceDefault.defaultTrailingZero())")
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
                    
//                    TopUpAmountOptions(amountInput: $amountInput, selectedAmount: $selectedAmount)
                    
                    VStack {

                        HStack {
                            TopUpAmountComponent(isSelected: $isSelected20, amountIcon: Prompt.Icon.amount1, amount: 20000)
                                .onTapGesture {
                                    isSelected20.toggle();
                                    if isSelected20 {
                                        isSelected50 = false;
                                        isSelected100 = false;
                                        viewModel.topUpAmount = 20000
                                    }
                                }
                            Spacer()
                            TopUpAmountComponent(isSelected: $isSelected50, amountIcon: Prompt.Icon.amount2, amount: 50000)
                                .onTapGesture {
                                    isSelected50.toggle();
                                    if isSelected50
                                    {
                                        isSelected20 = false;
                                        isSelected100 = false;
                                        
                                        viewModel.topUpAmount = 50000
                                    }
                                }
                            Spacer()
                            TopUpAmountComponent(isSelected: $isSelected100, amountIcon: Prompt.Icon.amount3, amount: 100000)
                                .onTapGesture {
                                    isSelected100.toggle();
                                    if isSelected100 {
                                        isSelected50 = false;
                                        isSelected20 = false;
                                        
                                        viewModel.topUpAmount = 100000
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
                    .padding(10)
                    
                    //Button type amount
                    VStack {
                        NavigationLink {
                            // Toggle
//                            showInsertTopUpAmountView.toggle()
                            Profile_EnterTopUpAmount(amountInput: $amountInput)
                                .navigationBarHidden(true)
                            
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
//                        .sheet(isPresented: $showInsertTopUpAmountView) {
//                            VStack {
//                                //Drag indicator
//                                Capsule()
//                                    .fill(Color.secondary)
//                                    .opacity(0.5)
//                                    .frame(width: 35, height: 5)
//                                    .padding(.top, 15)
//
//                                //Sheet content
//                                VStack (alignment: .leading){
//
//                                    Text(Prompt.Caption.enterTopUpAmount)
//                                        .font(.callout)
//
//                                    //Text Field
//                                    VStack {
//                                        TextField(Prompt.paymentContent.redeemCode, text: $amountInput)
//                                            .keyboardType(.numberPad)
//                                            .padding(.leading, 10)
//                                            .font(.system(size: 22, weight: .bold))
//
//                                        Divider()
//                                            .background(.black)
//                                    }
//                                    .bold()
//                                    .padding(.top)
//                                }
//                                .padding(.top, 20)
//                                .padding(.horizontal, 25)
//
//                                Spacer()
//
//                                //Button Continue
//                                NavigationLink {
//                                    //Go to top up confirmation
//                                    Profile_TopUpConfirmation()
//                                } label: {
//                                    Text(Prompt.Button.continueProcess)
//                                        .frame(maxWidth: .infinity)
//                                        .padding(.vertical, 15)
//                                }
//                                .onTapGesture(perform: {showInsertTopUpAmountView.toggle()})
//                                .font(.title2)
//                                .bold()
//                                .foregroundColor(.white)
//                                .background(AppColor.paymentBlueTextColor)
//                                .buttonStyle(.borderless)
//                            }
//                            .presentationDetents([.medium])
                            
                        }
                    }
                    
                    Spacer()
                    
                    //Button continue
                    VStack {
                        NavigationLink {
                            Profile_TopUpConfirmation(amountInput: $amountInput)
                                .navigationBarHidden(true)
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
//            .blur(radius: showInsertTopUpAmountView ? 2 : 0)
//            .animation(.easeOut(duration: 0.2), value: showInsertTopUpAmountView)
    }
}

struct Profile_TopUpView_Previews: PreviewProvider {
    static var previews: some View {
        Profile_TopUpView()
            .environmentObject(parenthingsViewModel())
    }
}
