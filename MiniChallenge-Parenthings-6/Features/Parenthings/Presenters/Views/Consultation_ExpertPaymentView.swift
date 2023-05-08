//
//  Consultation:ExpertPaymentView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 28/04/23.
//

import SwiftUI

struct ExpertPaymentView: View {
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    @StateObject var userViewModel = UserViewModel()

    var expert : Expert;
    @State var transactionDetail : ConsultationTransaction;
    
    @Environment(\.presentationMode) var presentationMode
    @State var chatViewModel : ChatViewModel?
    @State var userName : String = "No Name"
    @State var userBalance : Double = 0.0
    
    //    init(expert : Expert, _ user : User, vm : parenthingsViewModel, backButton : () -> Void) {
    //        self.expert = expert
    //        self._transactionDetail = State(initialValue : ConsultationTransaction(expert: expert, TransactionDate: Date(), payWith: .Parenthing))
    //        self.currentUser = user;
    //        self.vm = vm;
    ////        self.backButton = backButton
    //    }
    init( expert: Expert) {
        self.expert = expert
        self._transactionDetail = State(initialValue : ConsultationTransaction(expert: expert, TransactionDate: Date(), payWith: .Parenthing))
        
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Consultation for")
                                .font(.system(size: 17))
                            Spacer();
                        }
                        .padding(.leading, 16)
                        HStack{
                            Text(userName)
                                .font(.system(size: 17, weight: .bold))
                            Spacer();
                        }
                        .padding(.leading, 16)
                    }
                    .frame(width: 393, height: 92)
                    .background(AppColor.grayLightColor)
                    .clipShape(
                        TopRoundedRectangle(cornerRadius: 10)
                    )
                    .padding(.top, 58)
                    
                    
                    
                    HStack {
                        
//                        if expert.imageBase64.toUIImage() != nil  {
//                            Image(uiImage: expert.imageBase64.toUIImage()!)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 63, height: 79)
//
//                        } else {
//                            Image(systemName: "person.fill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 63, height: 79)
//                        }
                        AsyncImage(url: URL(string: expert.imageBase64 ?? "")) { image in
                            image
                                .resizable()
                                .frame(width: 63, height: 63)
                               
                        } placeholder: {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 63, height: 63)

                            
                        }
                        
                        VStack (alignment: .leading){
                            Text(expert.name)
                                .font(.system(size: 22, weight: .bold))
                            Text(expert.role)
                                .font(.system(size : 15, weight: .regular))
                                .foregroundColor(AppColor.paymentGrayTextColor)
                        }
                        
                        Spacer()
                    }.padding(.leading, 16)
                    
                    
                    
                    TransactionDetailViewComponent(transactionDetail: transactionDetail, useDivider : true
                    )
                    
                    HStack{
                        HStack{
                            Image("promo-code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33.88, height: 29.26)
                                .padding()
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.leading, 12)
                        .padding(.trailing, 11)
                        .padding(.vertical, 10)
                        
                        Text("Apply Your Coupon")
                            .font(.system(size: 15, weight: .semibold))
                        
                        Spacer()
                        
                        Text(.init(systemName: "chevron.right"))
                            .padding(.trailing, 10)
                    }
                    .background(AppColor.systemGray)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                    .padding(.horizontal, 18)
                    .padding(.top, 15)
                    .frame(height: 70)
                    
                    
                    // letakin kupons
                    
                    
                    
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
                                withAnimation {
                                    viewModel.choosePayment = true
                                }
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
                            
                            self.chatViewModel = ChatViewModel(currentUser: viewModel.user!, expert: viewModel.selectedConsultation!.expert);
                            
                            if let chatViewModel  = self.chatViewModel {
                                viewModel.messages = chatViewModel.messagesCurrentUser + chatViewModel.messageExpert
                            } else {
                                print("Error")
                            }
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
                    
                    NavigationLink("", destination: ChatExpert(selectedExpert: expert).navigationBarHidden(true), isActive: $viewModel.startConsulting)
                    
                }
                .transition(.opacity)
                //            .sheet(isPresented: $viewModel.choosePayment) {
                //                VStack(alignment: .leading) {
                //                    Text("Select a payment method")
                //                        .font(.system(size: 22, weight: .bold))
                //                        .padding(.leading, 18)
                //
                //                    HStack{
                //                        LazyVGridPaymentType(typePayment: .Parenthing, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("LogoParenthing"), description: "Parenthing", iscomingSoon: false)
                //                    }
                //
                //                    Divider()
                //
                //
                //                    HStack{
                //                        LazyVGridPaymentType(typePayment: .BankTransfer, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image(systemName: "banknote.fill"), description: "Bank Transfer", iscomingSoon: false)
                //                    }
                //
                //                    Divider();
                //
                //                    HStack{
                //                        LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("Gopay"), description: "GoPay", iscomingSoon: false)
                //                    }
                //
                //                    Divider();
                //
                //                    HStack{
                //                        LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("Ovo"), description: "Ovo", iscomingSoon: false)
                //                    }
                //
                //                    Divider();
                //
                //                    HStack{
                //                        LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("Dana"), description: "Dana", iscomingSoon: false)
                //                    }.padding(.bottom, 400)
                //                }
                //            }
                .background(
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
                .blur(radius: (viewModel.choosePayment) ? 10 : 0)
                
                .navigationBarHidden(false)
                if (viewModel.choosePayment) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 50, height: 3)
                                Spacer()
                            }
                            .padding(.top, 16)
                            Text("Select a payment method")
                                .font(.system(size: 22, weight: .bold))
                                .padding(.leading, 18)
                            
                        }
                        
                        VStack {
                            HStack{
                                LazyVGridPaymentType(typePayment: .Parenthing, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("LogoParenthing"), description: "Parenthing", iscomingSoon: false)
                            }
                            
                            Divider()
                            
                            
                            HStack{
                                LazyVGridPaymentType(typePayment: .BankTransfer, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image(systemName: "banknote.fill"), description: "Bank Transfer", iscomingSoon: false)
                            }
                            
                            Divider();
                            
                            HStack{
                                LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("Gopay"), description: "GoPay", iscomingSoon: false)
                            }
                            
                            Divider();
                            
                            HStack{
                                LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("Ovo"), description: "Ovo", iscomingSoon: false)
                            }
                            
                            Divider();
                            
                            HStack{
                                LazyVGridPaymentType(typePayment: .GoPay, transactionDetail: self.transactionDetail, currentUser: viewModel.user!, paymentLogo: Image("Dana"), description: "Dana", iscomingSoon: false)
                            }.padding(.bottom, 400)
                                .transition(.move(edge: .bottom))
                        }
                    }
                    
                    .overlay {
                        TopRoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 0)
                            .shadow(color: .black, radius: 0.3, x: 0.2, y: 0.3)
                    }
                    .background(.white)
                    .offset(y : 380)
                    .transition(.move(edge: .bottom))
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                if value.translation.height > 50 {
                                    withAnimation {
                                        viewModel.choosePayment = false
                                    }
                                }
                            }
                    )
                    
                }
            }.onAppear{
                let userApiModel = userViewModel.getLoginSession()
                
                userName  = userApiModel?.name ?? "No Name"
                userBalance  = userApiModel?.balance ?? 0.0
                viewModel.user = User(id: UUID(uuidString: userApiModel?.id ?? ""), name: userName, balanceParenting: userBalance)
            }
        }
    }
}
struct Consultation_ExpertPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpertPaymentView(expert: Expert(id: UUID(), name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "gobok")?.toBase64()) ?? "", isAvailable: false))
            .environmentObject(parenthingsViewModel())
        
//        ExpertPaymentView(vm: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "gobok")?.toBase64()) ?? "", isAvailable: false), currentUser: User(name: "Elvin", balanceParenting: 30000), expert: parenthingsViewModel(), backButton: {
//            print("Clicked")
//        });
    }
}
