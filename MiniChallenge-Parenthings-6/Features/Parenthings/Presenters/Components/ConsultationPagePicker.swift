//
//  ConsultationPagePicker.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 23/04/23.
//

import SwiftUI

struct ConsultationListFilter: View {
    
    @Binding var selectedValue : String;
    
    var body: some View {
        VStack {
            Picker("listFilter", selection: $selectedValue) {
                ForEach( Prompt.Picker.pickerList, id : \.self) {item in
                    Text(item).tag(item)
                }
            }.pickerStyle(.segmented)
            
        }.padding()
    }
}

struct ConsultationPagePicker_Previews: PreviewProvider {
    static var previews: some View {
            ConsultationListFilter(selectedValue:  .constant("Ongoing"))
    }
}
