//
//  ActionSheetEditProfile.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 05/05/23.
//

import SwiftUI

struct ActionSheetEditProfile: View {
    var body: some View {
        Button {
            //
        } label: {
            Text(Prompt.Button.save)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
            
        }
        .font(.title2)
        .bold()
        .foregroundColor(.white)
        .background(AppColor.paymentBlueTextColor)
        .buttonStyle(.borderless)
        .cornerRadius(15)
    }
    
}

struct ActionSheetEditProfile_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetEditProfile()
    }
}
