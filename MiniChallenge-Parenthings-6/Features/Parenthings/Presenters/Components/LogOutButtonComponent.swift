//
//  LogOutButtonComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 05/05/23.
//

import SwiftUI

struct LogOutButtonComponent: View {
    @Binding var showAlert : Bool
    
    var body: some View {
        Button {
            showAlert = true
        } label: {
            ImageLabel(imageName: Prompt.Icon.logOut, imageText: Prompt.Button.logOut, isCustom: false)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(AppColor.grayLightColor, lineWidth: 1)
                )
        }
        .padding(.top, 50)
        .foregroundColor(AppColor.paymentBlueTextColor)
        .alert(Prompt.AlertTitle.logOut, isPresented: $showAlert) {
            Button(Prompt.Button.cancel, role: .cancel) {
                // no action needed here
            }
            Button(Prompt.Button.logOutAlert, role: .destructive) {
                // action log out
            }
        
        } message: {
            Text(Prompt.AlertMessages.logOutMessage)
        }
        
    }
}
    
    struct LogOutButtonComponent_Previews: PreviewProvider {
        static var previews: some View {
            LogOutButtonComponent(showAlert: .constant(true))
        }
    }
