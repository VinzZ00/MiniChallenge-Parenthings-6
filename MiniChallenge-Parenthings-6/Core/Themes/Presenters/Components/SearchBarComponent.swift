//
//  SearchBarComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import SwiftUI

struct SearchBar: View {
    let defaultText : String;
    @Binding var text: String
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
            TextField(defaultText, text: $text)
                .foregroundColor(.black)
                .onTapGesture {
                    viewModel.textFieldIsClicked = true
                }
        }
        .frame(width: 357, height: 49)
        .background(Color(UIColor(red:0.949, green:0.949, blue:0.969, alpha:1.00)))
        .cornerRadius(10)
        
    }
}

struct SearchBarComponent_Previews: PreviewProvider {
    
    
    static var previews: some View {
        VStack {
            SearchBar(defaultText :  " Search Expert or Transaction", text: .constant(""))
        }
    }
}
