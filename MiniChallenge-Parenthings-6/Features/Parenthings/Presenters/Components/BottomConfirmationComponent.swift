//
//  BottomConfirmationComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 04/05/23.
//

import SwiftUI

struct BottomConfirmationComponent: View {
    @EnvironmentObject var viewModel : parenthingsViewModel
    @EnvironmentObject var paymentTypeViewModel : PaymentTypeViewModel
    
    @StateObject var userViewModel = UserViewModel()

    @State private var isActive: Bool = false
    @State private var totalTopUp : Double = 0.0
    @State private var userId : String = ""
    @State private var userBalance : Double = 0.0
    
    @Binding var selectedPaymentType : TypePayment
    @Binding var showInsertTopUpAmountView : Bool
    
    @Binding var topUpFee : Double
    @Binding var amountInput : String
    
    var body: some View {
        //Top up method confirmation
        VStack{
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Button {
                            showInsertTopUpAmountView.toggle()
                        } label: {
                            if topUpFee != 0 {
                                HStack {
                                    Image(paymentTypeViewModel.getDetails(paymentType: selectedPaymentType).logo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 35, maxHeight: 35)
                                        .padding(.trailing, 10)
                                    
                                    VStack (alignment: .leading) {
                                        Text(paymentTypeViewModel.getDetails(paymentType: selectedPaymentType).name)
                                            .font(.callout)
                                            .foregroundColor(.black)
                                        
                                        Text("\((viewModel.getTotalAmountPaid(amount: Double(amountInput) ?? 1, fee: topUpFee)).defaultTrailingZero())")
                                            .bold()
                                            .foregroundColor(.black)
                                    }
                                }
                            } else {
                                HStack {
                                    VStack (alignment: .leading) {
                                        Text(Prompt.paymentContent.topUpWith)
                                            .font(.callout)
                                            .bold()
                                            .foregroundColor(.black)
                                        Text(Prompt.Caption.selectTopUpWithGuide)
                                            .foregroundColor(AppColor.red)
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                            
                           
                        }
                        .buttonStyle(.borderless)
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
                                    PaymentTypeOptions(topUpFee: $topUpFee, selectedPaymentType: $selectedPaymentType, showInsertTopUpAmountView: $showInsertTopUpAmountView)
                                        .environmentObject(PaymentTypeViewModel())
                                }
                                .padding(.top, 20)
                                .padding(.horizontal, 25)
                                
                                Spacer()
                            }
                            .presentationDetents([.fraction(0.45)])
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            showInsertTopUpAmountView.toggle()
//                            totalTopUp = viewModel.getTotalAmountPaid(amount: Double(amountInput) ?? 1, fee: topUpFee)
                        } label: {
                            Image(systemName: Prompt.Icon.circleAndThreeDots)
                                .foregroundColor(AppColor.grayOpacity60)
                        }
                        .buttonStyle(.borderless)
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
                                    PaymentTypeOptions(topUpFee: $topUpFee, selectedPaymentType: $selectedPaymentType, showInsertTopUpAmountView: $showInsertTopUpAmountView)
                                        .environmentObject(PaymentTypeViewModel())
                                }
                                .padding(.top, 20)
                                .padding(.horizontal, 25)
                                
                                Spacer()
                            }
                            .presentationDetents([.fraction(0.45)])
                        }
                    }
                }
                
                //Button confirm and top up
                VStack {
                    NavigationLink{
                    } label: {
                        Button {
                            //NO API
                            viewModel.addUserBalance(amount: Double(amountInput) ?? 0)
                            viewModel.topUpAmount = Double(amountInput) ?? 0
                            viewModel.topUpFee = topUpFee
                            viewModel.totalPayment = viewModel.getTotalAmountPaid(amount: Double(amountInput) ?? 0, fee: topUpFee)

                            //USE API
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
                        PaymentSuccessPageView(amountInput: $amountInput, topUpFee: $topUpFee)
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
        BottomConfirmationComponent(selectedPaymentType: .constant(TypePayment.Parenthing), showInsertTopUpAmountView: .constant(false), topUpFee: .constant(10), amountInput: .constant("0"))
            .environmentObject(parenthingsViewModel())
    }
}
