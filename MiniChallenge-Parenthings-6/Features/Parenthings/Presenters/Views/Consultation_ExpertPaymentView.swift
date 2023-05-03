//
//  Consultation:ExpertPaymentView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 28/04/23.
//

import SwiftUI

struct ExpertPaymentView: View {
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    var currentUser : User;
    var expert : Expert;
    @State var transactionDetail : ConsultationTransaction;
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
//    init(expert : Expert, _ user : User, vm : parenthingsViewModel, backButton : () -> Void) {
//        self.expert = expert
//        self._transactionDetail = State(initialValue : ConsultationTransaction(expert: expert, TransactionDate: Date(), payWith: .Parenthing))
//        self.currentUser = user;
//        self.vm = vm;
////        self.backButton = backButton
//    }
    init(currentUser: User, expert: Expert) {
        self.currentUser = currentUser
        self.expert = expert
        self._transactionDetail = State(initialValue : ConsultationTransaction(expert: expert, TransactionDate: Date(), payWith: .Parenthing))
        
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack {
                    
                    if expert.imageBase64.toUIImage() != nil  {
                        Image(uiImage: expert.imageBase64.toUIImage()!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 63, height: 79)
                            
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 63, height: 79)
                    }
                    
                    VStack (alignment: .leading){
                        Text(expert.name)
                            .font(.system(size: 22, weight: .bold))
                        Text(expert.role)
                            .font(.system(size : 15, weight: .regular))
                            .foregroundColor(AppColor.paymentGrayTextColor)
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                .padding()
                
                
                
                TransactionDetailViewComponent(transactionDetail: transactionDetail
                )
                
                
                
                Text(Prompt.paymentContent.choosePayment)
                    .font(.system(size : 15, weight: .bold))
                    .padding(.leading, 16)
                    .padding(.top, 34)
                    .padding(.bottom, 17)
                

                
                .padding(.bottom, 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray.opacity(0.001), lineWidth: 2)
                        .padding(.horizontal, 16)
                        .shadow(color: .black.opacity(0.10), radius: 2, y: 2).blur(radius: 0.29)
                )
                .background(.white)
                    
                    
                
                Spacer()
                VStack{
                    HStack{
                        HStack{
                            viewModel.paymentDetail.0
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .overlay {
                                    Circle()
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                            
                            
                            VStack(alignment: .leading) {
                                Text(viewModel.paymentDetail.1)
                                    .font(.system(size : 12))
                                Text("\(String(format: "%.2f", transactionDetail.totalPrice))")
                                    .font(.system(size: 15, weight: .bold))
                            }
                        }
                        .padding(.leading, 16)
                        
                        Spacer()
                        
                        Button{
                            viewModel.choosePayment = true
                        } label : {
                            Image(systemName: "ellipsis.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 16)
                        }
                    }.padding(.horizontal, 16)
                        .padding(.top, 15)
                    
                    Button {
                        viewModel.selectedConsultation = ConsultationTransaction(expert: viewModel.selectedExpert!, TransactionDate: Date(), payWith: .Parenthing)
                        viewModel.transactions.add(transaction: viewModel.selectedConsultation!)
                        viewModel.startConsulting = true
                        viewModel.remainingTime = viewModel.selectedConsultation!.timeRemaining;
                    } label: {
                        VStack {
                            Text(Prompt.Button.startConsulting)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 357, height: 53)
                        .background(
                            AppColor.paymentBlueTextColor
                        )
                        .cornerRadius(15)
                        .padding(.horizontal, 18)
                        .padding(.bottom, 18)
                        .padding(.top, 18)
                        
                    }
                }
                .overlay(
                    Rectangle()
                        .stroke(Color.black.opacity(1), lineWidth: 0.2)
                        .shadow(color: .black, radius: 9, y : 5)
                        
                )
                .frame(width: 393, height: 83)
                
                NavigationLink("", destination: ChatExpert().navigationBarHidden(true), isActive: $viewModel.startConsulting)
                
            }.background(
                VStack
                {
                    CustomNavigationBar(title: Prompt.Title.payment, enableBackButton: true, backButton: {
                        presentationMode.wrappedValue.dismiss()
                    })
                        .padding(.bottom, 81)
                    Spacer()
                }.background(
                AppBackground()
                )
            )
            .sheet(isPresented: $viewModel.choosePayment) {
                VStack(alignment: .leading) {
                    Text("Select a payment method")
                        .font(.system(size: 22, weight: .bold))
                    
                    HStack{
                        LazyVGridPaymentType(typePayment: .Parenthing, transactionDetail: self.transactionDetail, currentUser: self.currentUser, paymentLogo: Image("LogoParenthing"), description: "Parenthing", iscomingSoon: false)
                    }
                    
                    Divider()
                    
                
                    HStack{
                        LazyVGridPaymentType(typePayment: .BankTransfer, transactionDetail: self.transactionDetail, currentUser: self.currentUser, paymentLogo: Image(systemName: "banknote.fill"), description: "Bank Transfer", iscomingSoon: false)
                    }
                
                    Divider();
                    
                    HStack{
                        LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: self.currentUser, paymentLogo: Image("Gopay"), description: "GoPay", iscomingSoon: false)
                    }
                    
                    Divider();
                    
                    HStack{
                        LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: self.currentUser, paymentLogo: Image("Ovo"), description: "Ovo", iscomingSoon: false)
                    }
                    
                    Divider();
                    
                    HStack{
                        LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: self.currentUser, paymentLogo: Image("Dana"), description: "Dana", iscomingSoon: false)
                    }
                    
                                                
                        
                }
            }
            .navigationBarHidden(false)
        }
    }
}

//struct Consultation_ExpertPaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpertPaymentView(vm: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "gobok")?.toBase64()) ?? "", isAvailable: false), currentUser: User(name: "Elvin", balanceParenting: 30000), expert: parenthingsViewModel(), backButton: {
//            print("Clicked")
//        });
//    }
//}
