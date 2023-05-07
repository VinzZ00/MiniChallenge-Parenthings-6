//
//  OtpView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 03/05/23.
//

import Foundation
import SwiftUI
import Combine

struct OtpView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var userViewModel = UserViewModel()
    var userData: UserApiModel
    @EnvironmentObject viewModel : parenthingsViewModel;

    var title: String = ""
    var phone: String = ""
    @State var otp: String = ""
    @State var isOtpOk: Bool = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            Button(action: {
                //                        backButton();
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack (alignment: .top) {
                    
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .frame(width: 23, height: 34)
                        .font(.system(size: 28, weight: .bold))
                    Text(title)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                        .frame(height: 34)
                }
            }
            
            
            Text("OTP sent securely to SMS")
                .font(.system(size : 28, weight: .bold))
                .frame(alignment: .leading)
                .padding(.top, 24)
            
            Text("Enter the OTP we've just sent to \(phone).")
                .font(.system(size : 16, weight: .regular))
                .multilineTextAlignment(.leading)
                .padding(.top, 2)
            HStack(spacing: 0) {
                Text("Enter OTP")
                    .font(.system(size : 13, weight: .regular))
                Text("*")
                    .font(.system(size : 13, weight: .regular))
                    .foregroundColor(Color.red)
                
            }                    .padding(.top, 16)
            
 
                VStack(spacing: 4) {
                    TextField("Enter OTP Number" , text: $otp)
                        .keyboardType(.numberPad)
                        .font(.system(size: 28, weight: .bold))
                        .onReceive(Just(otp)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.otp = filtered
                            }
                        }
                        .onChange(of: otp) { _ in
                            otp = String(otp.prefix(6))
                           }
                    
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                }
            
            Spacer()
            NavigationLink(destination:  HomeRootView(), isActive: $isOtpOk){
                Button {
                    if(!otp.isEmpty){
                        userViewModel.setLoginSession(userData: userData)
                        isOtpOk = true
                        viewModel.user = User(id : UUID(uuidString: self.userData.id),
                                              name: self.userData.name, balanceParenting: self.userData.balance)
                    }
                } label: {
                    VStack{
                        Text(Prompt.Button.next)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 357, height: 53)
                    .background(AppColor.paymentBlueTextColor)
                    .cornerRadius(15)
                }
            }
            
        }
        .navigationBarHidden(true)
        .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
        .onAppear{
            UITextField.appearance().clearButtonMode = .whileEditing
            
        }
    }
    
    
}

struct Otp_Previews: PreviewProvider {
    static var previews: some View {
        OtpView(userData: UserApiModel(), title:"Sign In",phone: "+628122909218")
    }
}
