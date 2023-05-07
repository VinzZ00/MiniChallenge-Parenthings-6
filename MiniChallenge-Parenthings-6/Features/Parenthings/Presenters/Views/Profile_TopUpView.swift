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
    
    @State private var amountInput = "0"
    
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
                                        
                    VStack {
                        TopUpAmountOptions(amountInput: $amountInput)
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
