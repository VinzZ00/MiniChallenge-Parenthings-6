//
//  BottomConfirmationComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 04/05/23.
//

import SwiftUI

struct BottomConfirmationComponent: View {
    @EnvironmentObject var viewModel : parenthingsViewModel
    @StateObject var userViewModel = UserViewModel()
    
    @State private var isActive: Bool = false
    @State private var totalTopUp : Double = 0.0
    @State private var userId : String = ""
    @State private var userBalance : Double = 0.0
    
    @Binding var topUpFee : Double
    @Binding var amountInput : String
    
    var body: some View {
        //Top up method confirmation
        VStack{
            VStack {
                HStack {
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 35, maxHeight: 35)
                        .background(.pink)
                    
                    VStack(alignment: .leading) {
                        Text(Prompt.paymentContent.topUpWith)
                            .font(.callout)
                            .bold()
                        Button {
                            
                        } label: {
                            Text(Prompt.Caption.selectTopUpWithGuide)
                                .foregroundColor(AppColor.red)
                        }
                        .buttonStyle(.borderless)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: Prompt.Icon.circleAndThreeDots)
                                .foregroundColor(AppColor.grayOpacity60)
                        }
                        .buttonStyle(.borderless)
                        
                    }
                }
                
                //Button confirm and top up
                VStack {
                    NavigationLink{
                    } label: {
                        Button {
                            //                            viewModel.addUserBalance(amount: Double(amountInput) ?? 0)
                            userViewModel.doUpdate(id: userId, balance: userBalance)
                            totalTopUp = viewModel.getTotalAmountPaid(amount: Double(amountInput) ?? 0, fee: topUpFee)
                            isActive = true
                        } label: {
                            Text(Prompt.Button.confirmAndTopUp)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                        }
                    }
                    .navigationDestination(isPresented: $isActive) {
                        PaymentSuccessPageView(totalTopUp: $totalTopUp)
                            .navigationBarHidden(true)
                            .toolbar(.hidden, for: .tabBar)
                    }
                    
                    //                    NavigationLink (
                    //                        destination: PaymentSuccessPageView(totalTopUp: $totalTopUp)
                    //                            .navigationBarHidden(true),
                    //                        isActive: $isActive,
                    //                        label: {
                    //                            Text(Prompt.Button.confirmAndTopUp)
                    //                                .frame(maxWidth: .infinity)
                    //                                .padding(.vertical, 15)
                    //                        }
                    //                    )
                    //                    .onChange(of: isActive) { (newValue) in
                    //                        if newValue {
                    //                            viewModel.addUserBalance(amount: Double(amountInput) ?? 0)
                    //                            totalTopUp = viewModel.getTotalAmountPaid(amount: Double(amountInput) ?? 0, fee: 2)
                    //    //                        viewModel.userTest?.balanceParenting += Double(amountInput)!
                    //                        }
                    
                    //                    }
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .background(AppColor.paymentBlueTextColor)
                    .buttonStyle(.borderless)
                    .cornerRadius(15)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 35)
            .padding(.top, 20)
            
        }
        .onAppear{
            let userApiModel = userViewModel.getLoginSession()
            
            userId = userApiModel?.id ?? ""
            userBalance = userApiModel?.balance ?? 0.0
                           
            userBalance = userBalance + (Double(amountInput) ?? 0.0) 
                           
            }
                .background(AppColor.white)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.bottom)
                .shadow(color: AppColor.grayLightColor, radius: 29, x: 0, y: 5)
                           }
                           }
                           
                           struct BottomConfirmationComponent_Previews: PreviewProvider {
                static var previews: some View {
                    BottomConfirmationComponent(topUpFee: .constant(10), amountInput: .constant("0"))
                        .environmentObject(parenthingsViewModel())
                }
            }
