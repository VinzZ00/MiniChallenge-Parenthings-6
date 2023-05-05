//
//  SaveButtonComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 05/05/23.
//

import SwiftUI

struct SaveButtonComponent: View {
    @Binding var showOptions : Bool
    @Binding var selectedOption : String
    
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
        .confirmationDialog(Prompt.ActionSheeetDialog.editDialog, isPresented: $showOptions, titleVisibility: .visible) {
            Button(Prompt.Button.keepEditing, role: .destructive) {
                selectedOption = Prompt.Button.keepEditing
            }
        }
    }
}

struct SaveButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonComponent(showOptions: .constant(true), selectedOption: .constant("none"))
//        SaveButtonComponent(showOptions: true, selectedOption: "none")
    }
}
