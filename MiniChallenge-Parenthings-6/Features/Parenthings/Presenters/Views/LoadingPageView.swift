//
//  LoadingPage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 27/04/23.
//

import SwiftUI

struct LoadingPage: View {
    @State var isAnimated : Bool = false;
    var body: some View {
        VStack{
            HStack{
                Spacer()
                VStack(spacing: 0){
                    Image("LogoParenthing")
                    Text("Parenting Wisdom In Your Fingertips")
                        .font(.system(size: 18, weight: .bold
                                     ))
                }.padding(.top, 126)
                Spacer()
            }
            Spacer();
            Image("LaunchScreen")
        }
        .opacity(isAnimated ? 1 : 0)
        .animation(.spring(response: 1, dampingFraction: 2, blendDuration: 0), value: isAnimated)
        .background(
            AppColor.gradientLandingPage
        )
        .ignoresSafeArea()
        .onAppear {
            self.isAnimated = true
        }
        
        
    }
}

struct LoadingPage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPage()
    }
}
