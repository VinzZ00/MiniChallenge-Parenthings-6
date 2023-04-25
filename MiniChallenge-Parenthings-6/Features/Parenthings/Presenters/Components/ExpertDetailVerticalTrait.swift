//
//  ExpertDetailVerticalText.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 26/04/23.
//

import SwiftUI

struct ExpertDetailVerticalTrait: View {
    
    var traitIcon : Image;
    var traitTitle : String;
    var traitDescription : String;
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                traitIcon
                Text(traitTitle)
                    .font(.system(size: 17, weight: .bold))
            }
            Text(traitDescription)
                .font(.system(size: 15))
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.leading, 34)
        }
    }
}

struct ExpertDetailVerticalText_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ExpertDetailVerticalTrait(traitIcon: Image(systemName: "graduationcap.fill"), traitTitle: "Education", traitDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        }
    }
}
