//
//  AlertLogOut.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 05/05/23.
//

import SwiftUI

struct AlertLogOut: View {
    @Binding var showAlert : Bool
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert("Important message", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct AlertLogOut_Previews: PreviewProvider {
    static var previews: some View {
        AlertLogOut(showAlert: .constant(true))
    }
}
