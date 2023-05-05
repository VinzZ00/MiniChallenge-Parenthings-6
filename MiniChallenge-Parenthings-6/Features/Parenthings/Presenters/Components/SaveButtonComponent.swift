//
//  SaveButtonComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 05/05/23.
//

import SwiftUI

struct SaveButtonComponent: View {
    @Binding var showAlert : Bool
    
    var body: some View {
        Button(Prompt.AlertTitle.logOut) {
            showAlert = true
        }
        .alert(Prompt.AlertMessages.logOutMessage, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct AlertLogOut_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonComponent(showAlert: .constant(true))
    }
}
