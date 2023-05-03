//
//  SignInView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 03/05/23.
//

import Foundation
import SwiftUI
import Combine

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var phone: String = ""
    @State var isOtp: Bool = false
    
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
                    Text("Sign In")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                        .frame(height: 34)
                }
            }
            
            
            
            Text("Enter your phone number")
                .font(.system(size : 28, weight: .bold))
                .frame(alignment: .leading)
                .padding(.top, 24)
            
            Text("You can log in or make an account if you're new to Parenthings")
                .font(.system(size : 16, weight: .regular))
                .multilineTextAlignment(.leading)
                .padding(.top, 2)
            HStack(spacing: 0) {
                Text("Phone number")
                    .font(.system(size : 13, weight: .regular))
                Text("*")
                    .font(.system(size : 13, weight: .regular))
                    .foregroundColor(Color.red)
                
            }                    .padding(.top, 16)
            
            HStack(spacing: 0) {
                HStack(spacing: 2) {
                    Text("ID".getFlag())                  .font(.system(size : 13, weight: .regular))
                    Text("+62")
                        .font(.system(size : 13, weight: .regular))
                }
                .padding(4)
                .background(Color(uiColor: UIColor.systemGray5))
                .border(Color(uiColor: UIColor.systemGray3),width: 1)
                .cornerRadius(4)
                
                Spacer(minLength: 8)
                VStack(spacing: 4) {
                    TextField("Enter Your Phone Number" , text: $phone)
                        .keyboardType(.numberPad)
                        .onReceive(Just(phone)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.phone = filtered
                            }
                        }
                    
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            NavigationLink(destination:  OtpView(title: "Sign In", phone: "+62\(phone)"), isActive: $isOtp){
                Button {
                    isOtp = true
                    //Login Function
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

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
