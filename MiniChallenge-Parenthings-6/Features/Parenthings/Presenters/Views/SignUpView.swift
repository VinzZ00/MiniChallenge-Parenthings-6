//
//  SignUpView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 03/05/23.
//

import Foundation
import SwiftUI
import Combine

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var userViewModel = UserViewModel()

    @State var name: String = ""
    @State var phone: String = ""
    @State var isOtp: Bool = false
    
    var body: some View {
        ZStack{
            contentView
            if(userViewModel.isLoading){
                ProgressPage()
            }
        } .alert(userViewModel.errorMessage ?? "",
                 isPresented: $userViewModel.isError) {
        }
    }
    
    var contentView: some View {
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
                    Text("Sign Up")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                        .frame(height: 34)
                }
            }
            
    
            HStack(spacing: 0) {
                Text("Name")
                    .font(.system(size : 13, weight: .regular))
                Text("*")
                    .font(.system(size : 13, weight: .regular))
                    .foregroundColor(Color.red)
                
            }.padding(.top, 16)
            
            HStack(spacing: 0) {
                VStack(spacing: 4) {
                    TextField("Enter Your Name" , text: $name)
                       
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                
                Text("Phone number")
                    .font(.system(size : 13, weight: .regular))
                Text("*")
                    .font(.system(size : 13, weight: .regular))
                    .foregroundColor(Color.red)
                
            }.padding(.top, 8)
            
            HStack(spacing: 8) {
                
                HStack(spacing: 2) {
                    Text("ID".getFlag())                  .font(.system(size : 13, weight: .regular))
                    Text("+62")
                        .font(.system(size : 13, weight: .regular))
                }
                .padding(4)
                .background(Color(uiColor: UIColor.systemGray5))
                .border(Color(uiColor: UIColor.systemGray3),width: 1)
                .cornerRadius(4)
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
            NavigationLink(destination:  OtpView(title: "Sign Up", phone: "+62\(phone)"), isActive: $userViewModel.isSignupSuccess){
                Button {
//                    isOtp = true
                    userViewModel.doSignup(phone:  "+62\(phone)", name: name)
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

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
