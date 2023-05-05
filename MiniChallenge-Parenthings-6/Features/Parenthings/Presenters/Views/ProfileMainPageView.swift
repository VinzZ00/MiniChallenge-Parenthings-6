//
//  ProfileMainPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

struct ProfileMainPageView: View {
    
    var profileName = "Username"
    var profilePhone = "+6200000000000"
    var profileBalance = 0
    
    var backButton : () -> Void;

    var body: some View {
        
        NavigationView {
            VStack (spacing: 0){
                CustomNavigationBar(title: Prompt.Title.profiles, enableBackButton: false, enableSearchBar: false, backButton: self.backButton)
                
                
                //Contents
                VStack {
                    //Profile info
                    HStack {
                        Image("UniversalPlaceHolder")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 80, maxHeight: 80)
                            .clipShape(Circle())
                        
                        VStack (alignment: .leading) {
                            HStack (alignment: .bottom) {
                                Text(profileName)
                                    .font(.system(size: 22, weight: .bold))
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: Prompt.Icon.edit)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight:20)
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 3)
                                }
                                .buttonStyle(.borderless)
                            }
                            Text(profilePhone)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                    }
                    
                    
                    //Balance info
                    VStack {
                        HStack {
                            //Current Balance
                            VStack (alignment: .leading, spacing: 3) {
                                LogoComponent()
                                HStack {
                                    Text(Prompt.paymentContent.balance)
                                        .foregroundColor(.gray)
                                    Text("Rp \(profileBalance)")
                                        .bold()
                                    Spacer()
                                }
                            }
                            
                            
                            Spacer()
                            
                            //Top up button
                            NavigationLink {
                                //Go to top up page
                                Profile_TopUpView()
                                    .navigationBarHidden(true)
                            } label: {
                                VStack {
                                    Image(systemName: Prompt.Icon.topUp)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 20)
                                    
                                    
                                    Text(Prompt.Button.topUp)
                                        .font(.callout)
                                        .bold()
                                }
                                
                                .foregroundColor(AppColor.paymentBlueTextColor)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                        .cornerRadius(10)
                        .background(AppColor.systemGray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(AppColor.grayLightColor, lineWidth: 2)
                        )
                        //                        .border(.gray)
                        
                    }
                    .cornerRadius(10)
                    .padding(.top, 20)
                    
                    
                    //Profile Menus
                    VStack {
                        //Payment Method
                        //                        ProfileMenuComponent(imageName: Prompt.Icon.paymentMethod, imageText: Prompt.Button.paymentMethod)
                        
                        //Help
                        //                        ProfileMenuComponent(imageName: Prompt.Icon.help, imageText: Prompt.Button.help)
                        
                        //Reddem coupon
                        //                        ProfileMenuComponent(imageName: Prompt.Icon.reedeemCoupon, imageText: Prompt.Button.redeemCoupon)
                    }
                    .padding(.top, 20)
                    
                    
//                    //Log out button
//                    Button {
//                        
//                    } label: {
//                        ImageLabel(imageName: Prompt.Icon.logOut, imageText: Prompt.Button.logOut, isCustom: false)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(AppColor.grayLightColor, lineWidth: 1)
//                            )
//                    }
//                    .padding(.top, 50)
//                    .foregroundColor(AppColor.paymentBlueTextColor)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .offset(y: -15)
                
            }
            .background(AppBackground())
        }
    }
}

//struct ProfileMainPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileMainPageView()
//    }
//}
