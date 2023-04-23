//
//  Background.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Rectangle()
                    .frame(width: 393, height: 696)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.ignoresSafeArea()
        }.background(
            LinearGradient(colors: [AppColor.gradientColorTopLeft, AppColor.gradientColorBottomRight], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}

struct Background_Previews: PreviewProvider {
    
    @State var something : String = ""
    
    static var previews: some View {
        VStack{
            CustomNavigationBar(title: "testing Background", enableBackButton: true, defaultTextSearchBar: "Find Something", searchText: .constant(""), enableSearchBar: true)
            Spacer();
        }
        .ignoresSafeArea()
        .background(AppBackground())
            
    }
}
