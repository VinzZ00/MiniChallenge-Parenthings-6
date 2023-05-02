//
//  ProfilePageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 02/05/23.
//

import SwiftUI

struct ProfilePageView: View {
    
    var profileName = "Username"
    var profileEmail = "emailName@gmail.com"
    var profilePhone = "+6200000000000"
    
    var profileBalance = 0
    
    var body: some View {
        
//        NavigationView {
            VStack (spacing: 0){
                CustomNavigationBar(title: Prompt.Title.profiles, enableBackButton: false, enableSearchBar: false, backButton: {} )
                
                
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
                            Text(profileName)
                                .font(.system(size: 22, weight: .bold))
                            Text(profileEmail)
                            Text(profilePhone)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                    }
                
                    
                    //Balance info
                    VStack {
                        HStack {
                            //Current Balance
                            VStack (alignment: .leading) {
                                LogoComponent()
                                HStack {
                                    Text(Prompt.paymentContent.balance)
                                    
                                    Text("Rp. \(profileBalance)")
                                        .bold()
                                }
                                .padding(0)
                            }
                            
                            Spacer()
                            
                            //Top up button
                            Button {
                            
                                
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
//                        .border(.gray)

                    }
                    .cornerRadius(10)
                    .padding(.top, 5)

                    
                    //Profile Menus
                    VStack {
                        //Payment Method
//                        ProfileMenuComponent(imageName: Prompt.Icon.paymentMethod, imageText: Prompt.Button.paymentMethod)
                        
                        //Help
//                        ProfileMenuComponent(imageName: Prompt.Icon.help, imageText: Prompt.Button.help)
                        
                        //Reddem coupon
                        ProfileMenuComponent(imageName: Prompt.Icon.reedeemCoupon, imageText: Prompt.Button.redeemCoupon)
                    }
                    .padding(.top, 20)
                    
                                        
                    //Log out button
                    Button {
                        
                    } label: {
                        ImageLabel(imageName: Prompt.Icon.logOut, imageText: Prompt.Button.logOut, isCustom: false)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                    }
                    .padding(.top, 50)
//                    .buttonStyle(.bordered)
                    .foregroundColor(AppColor.paymentBlueTextColor)
                    
                    Spacer()
                }
                .padding(.horizontal, 35)
                
                
            }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(AppBackground())
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
