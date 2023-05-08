//
//  HomeRootView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 23/04/23.
//

import SwiftUI

struct HomeRootView: View {
    
    @StateObject var viewModel = parenthingsViewModel();
    @StateObject var userViewModel = UserViewModel()
    @State private var selectedView = ""
    @State private var lastSelectedView = "Consultation"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
//        NavigationView{
//            VStack{
        if viewModel.startConsulting {
            if viewModel.getSelectedExpert() != nil {
                ChatExpert(selectedExpert: viewModel.getSelectedExpert()!)
                    .transition(.move(edge: .leading))
                    .environmentObject(viewModel)
            }
        } else if viewModel.expertDetailIsPresented {
            ExpertDetail()
                .transition(.move(edge: .trailing))
                .environmentObject(viewModel)
        }else if userViewModel.gotoLoginPage {
            SignInPopUP()
               .transition(.move(edge: .bottom))
               .animation(.linear, value: true)
               .navigationBarHidden(true)
               .environmentObject(userViewModel)

            
        } else {
            
            TabView(selection : $selectedView){
                VStack {
                    ConsultationMainPageView(backButton: {
                        presentationMode.wrappedValue.dismiss()
                    })
                    .navigationBarHidden(true)
                    .onAppear {
                        viewModel.textFieldIsClicked = false;
                    }
                }.tabItem {
                    VStack{
                        Image(systemName:  "rectangle.3.group.bubble.left.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 85, height: 21)
                            .padding(.bottom, 7)
                            .foregroundColor(AppColor.paymentBlueTextColor)
                        
                        Text(Prompt.Title.consultation)
                            .foregroundColor(AppColor.paymentBlueTextColor)
                    }
                }.tag("Consultation")
                
                VStack{
                    ArticleMainPageView(backButton: {
                        presentationMode.wrappedValue.dismiss()
                    })
                    .navigationBarHidden(true)
                    .onAppear {
                        viewModel.textFieldIsClicked = false;
                    }
                }.tabItem{
                    Image(systemName: "heart.text.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 21)
                        .padding(.bottom, 7)
                        .foregroundColor(AppColor.paymentBlueTextColor)
                    
                    Text(Prompt.Title.articles)
                        .foregroundColor(AppColor.paymentBlueTextColor)
                }.tag("Articles")
                
                VStack{
                    if (userViewModel.isLoggedIn){
                        ZStack {
                            ProfileMainPageView(selection: $selectedView, backButton: {
                                presentationMode.wrappedValue.dismiss()
                            })
                            .environmentObject(userViewModel)
                            .navigationBarHidden(true)

                        }
                    }else{
//                        userViewModel.gotoLoginPage = true
                    }
                    //Masukan Profile view
                }.tabItem{
                    Image(systemName: "person.text.rectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 21)
                        .padding(.bottom, 7)
                        .foregroundColor(AppColor.paymentBlueTextColor)
                    
                    Text(Prompt.Title.profiles)
                        .foregroundColor(AppColor.paymentBlueTextColor)
                }
                
                .tag("Profile")
            }
            .onChange(of: selectedView) { newValue in
               
                print(newValue)
                var _ = userViewModel.getLoginSession()
                if(!userViewModel.isLoggedIn) {

                    if(lastSelectedView.isEmpty){
                        lastSelectedView = selectedView
                    }
                    
                        if(selectedView == "Profile"){
                            userViewModel.gotoLoginPage = true
                            selectedView = lastSelectedView
                        }else{
                             lastSelectedView = selectedView
                        }
                    
                }
            }
            
            .environmentObject(viewModel)
        }
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
