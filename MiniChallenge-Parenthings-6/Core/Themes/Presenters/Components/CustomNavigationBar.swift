//
//  customNavbar.swift
//  MiniChallege-parenthings
//
//  Created by Elvin Sestomi on 20/04/23.
//

import Foundation
import SwiftUI

struct CustomNavigationBar : View {
    let title: String
    let enableBackButton : Bool;
    let defaultTextSearchBar : String;
    @Binding var searchText : String;
    let enableSearchBar : Bool;
    
    
    var body: some View {
        VStack{
            Spacer();
            HStack () {
                if enableBackButton {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .frame(width: 23, height: 34)
                    }
                }
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(height: 34)
                
                Spacer()
            }
            .padding(.top, 60)
            .padding(.leading, 18)
            
            
            if (enableSearchBar) {
                SearchBar(defaultText: defaultTextSearchBar, text: $searchText)
                    .padding(.top,25)
            }
        }
        .ignoresSafeArea()
        .frame(height: 135)
        
    }
}

struct Previews_customNavbar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavigationBar(title: "Consultation Detail", enableBackButton: true, defaultTextSearchBar: "Testing default Text", searchText: .constant("Testing"), enableSearchBar: true)
                .border(.white)
//            Text("Testing")
//                .foregroundColor(.white)
            
            Spacer();
        }
        .background(.black)
        
        
        ////        NavigationView{
        //            VStack{
        //                Text("")
        //
        ////            }
        //                .navigationBarTitle("")
        //                .navigationBarHidden(true)
        //                .background(CustomNavigationBar(gradientColors: [AppColor.gradientColorTopLeft, AppColor.gradientColorBottomRight], title: "Custom Navbar Preview"))
        //                Spacer()
        //        }
    }
}


