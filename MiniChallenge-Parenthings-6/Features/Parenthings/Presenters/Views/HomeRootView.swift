//
//  HomeRootView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 23/04/23.
//

import SwiftUI

struct HomeRootView: View {
    
    @StateObject var viewModel = parenthingsViewModel();
    @State private var selectedView = "Consultation"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
//        NavigationView{
//            VStack{
                TabView(selection : $selectedView){
                        VStack {
                            ConsultationMainPageView(backButton: {
                                presentationMode.wrappedValue.dismiss()
                            })
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
                        Text("Articles View")
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
                        Text("Profile View")
                        
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
                }.environmentObject(viewModel)
                
//            }.environmentObject(viewModel)
//        }
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
