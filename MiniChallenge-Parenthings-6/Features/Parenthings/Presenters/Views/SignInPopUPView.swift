//
//  SignInPopUP.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 29/04/23.
//

import SwiftUI

struct SignInPopUP: View {
    
//    @State var isShown : Bool = true;
    @State var isDisposed : Bool = false
    @State var isLogin : Bool = false;
    @State var isRegist : Bool = false;
    
    @Environment(\.presentationMode) var presentationMode;
    
    var body: some View {
        
        if !isDisposed {
            NavigationView{
                VStack{
                    HStack {
                        Image("LogoParenthing")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 131.76, height: 32)
                        Spacer();
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label : {
                            Image(systemName:  "x.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 34)
                                .foregroundColor(AppColor.grayLightColor)
                        }
                        
                    }.padding(.horizontal, 18)
                    Spacer()
                    
                    Image("SignInBanner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 357.67, height: 245)
                    
                    Text("Welcome to parenthings!")
                        .font(.system(size : 28, weight: .bold))
                        .padding(.top, 30.35)
                    
                    Text("Your problem is our problem, we know how's your feeling like, dont hasitate to reach Us")
                        .frame(width: 357)
                        .font(.system(size : 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.top, 9)
                        .padding(.bottom, 30)
                    
                    NavigationLink(destination:                     SignInView(), isActive: $isLogin){
                        Button {
//                            isLogin = true
                            isDisposed = true;
                            //Login Function
                        } label: {
                            VStack{
                                Text(Prompt.Button.logIn)
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 357, height: 53)
                            .background(AppColor.paymentBlueTextColor)
                            .cornerRadius(15)
                        }
                        .padding(.bottom, 15)
                    }
                    NavigationLink(destination: SignUpView(), isActive: $isRegist){
                        Button {
                            //Sign UP Function
                            isRegist = true

                        } label: {
                            VStack{
                                Text(Prompt.Button.signUp)
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(AppColor.paymentBlueTextColor)
                            }
                            .frame(width: 357, height: 53)
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(AppColor.paymentBlueTextColor, lineWidth: 2)
                            )
                        }
                    }
                }
              
            }
            
        }
        
    }
}

struct SignInPopUP_Previews: PreviewProvider {
    static var previews: some View {
        SignInPopUP()
    }
}
