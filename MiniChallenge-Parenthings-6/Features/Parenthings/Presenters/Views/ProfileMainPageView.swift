//
//  ProfileMainPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 03/05/23.
//

import SwiftUI

struct ProfileMainPageView: View {
    
    @State private var showAlert: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var navigate = false

    @State var profileName = "Username"
    @State var profilePhone = "+6200000000000"
    @State var profileBalance: Double = 0.0
    
    @Binding var selection: String
    var profileNameDefault = "Username"
    var profilePhoneDefault = "+6200000000000"
    var profileBalanceDefault : Double = 50_000
    
    var backButton : () -> Void;

    var body: some View {
        if userViewModel.gotoEditPage {
            EditProfileView()
               .transition(.move(edge: .bottom))
               .animation(.linear, value: true)
               .navigationBarHidden(true)
               .toolbar(.hidden, for: .tabBar)
               .environmentObject(userViewModel)

        } else {
            contentView
        }
    }
    var contentView: some View {
        
        NavigationStack {
            ZStack{
                NavigationLink(destination: HomeRootView()
                    .navigationBarHidden(true)
                    .toolbar(.hidden, for: .tabBar)
                               , isActive: $navigate){
                    EmptyView()
                }
                VStack (spacing: 0){
                    CustomNavigationBar(title: Prompt.Title.profiles, enableBackButton: false, enableSearchBar: false, backButton:{})
                    
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
                                    Spacer()
                                    
                                 
                                        Button {
                                            userViewModel.gotoEditPage = true
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
                                        Text("Rp \(profileBalance.defaultTrailingZero())")
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
                                        .toolbar(.hidden, for: .tabBar)
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
                        //                    VStack {
                        //Payment Method
                        //                        ProfileMenuComponent(imageName: Prompt.Icon.paymentMethod, imageText: Prompt.Button.paymentMethod)
                        
                        //Help
                        //                        ProfileMenuComponent(imageName: Prompt.Icon.help, imageText: Prompt.Button.help)
                        
                        //Reddem coupon
                        //                        ProfileMenuComponent(imageName: Prompt.Icon.reedeemCoupon, imageText: Prompt.Button.redeemCoupon)
                        //                    }
                        //                    .padding(.top, 20)
                        
                        
                        //                    //Log out button
                        LogOutButtonComponent(showAlert: $showAlert, selection: $selection)
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
            }
            .onAppear{
                
                let userApiModel = userViewModel.getLoginSession()
                profileName = userApiModel?.name ?? profileNameDefault
                profilePhone = userApiModel?.phone ?? profilePhoneDefault
                profileBalance = (userApiModel?.balance ?? Double(profileBalanceDefault))
                
            }
            .background(AppBackground())
            .alert(Prompt.AlertTitle.logOut, isPresented: $showAlert) {
                Button(Prompt.Button.logOut, role: .destructive) {
                    DispatchQueue.main.async {
                        self.userViewModel.removeLoginSession()
                        self.navigate = true
                        print("logout is clicked")
                    }
                }
                Button("Cancel", role: .cancel) {
                    
                }
            } message: {
                Text(Prompt.AlertMessages.logOutMessage)
            
            }
//            .alert(isPresented: $showAlert) {
//                Alert(
//                 title: Text(Prompt.AlertTitle.logOut),
//                   message: Text(Prompt.AlertMessages.logOutMessage),
//
//                 primaryButton: .destructive(Text(Prompt.Button.logOut) ,action: {
//                       //action here
//                     self.navigate = true
//                     self.userViewModel.removeLoginSession()
//                   }),
//                   secondaryButton: .cancel()
//               )
//
//            }
        }
        .transition(.move(edge: .leading))
        .background(
            AppBackground()
        )
    }
}

struct ProfileMainPageView_Previews: PreviewProvider {
    var backButton : () -> Void;

    static var previews: some View {
        ProfileMainPageView(selection: .constant("Profile"), backButton: {self})
            .environmentObject(parenthingsViewModel())

    }
}
