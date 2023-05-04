//
//  ProgressPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ProgressPage: View {
    
    var body: some View {
        ZStack{
            ProgressView()
                .frame(width: UIScreen.screenWidth, height:  UIScreen().screenHeight2())
        }                .background(Color.black.opacity(0.5))

        
    }
}

struct ProgressPage_Previews: PreviewProvider {
    static var previews: some View {
        ProgressPage()
    }
}
