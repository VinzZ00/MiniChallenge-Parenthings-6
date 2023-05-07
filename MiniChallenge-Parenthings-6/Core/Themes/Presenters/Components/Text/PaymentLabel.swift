//
//  PaymentLabel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 07/05/23.
//

import SwiftUI

struct PaymentLabel: View {
    var imageName: String
    var imageText: String
    var isCustom: Bool
    
    var body: some View {
        HStack (alignment: .bottom){
            VStack {
                if(isCustom){
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 100, maxHeight: 19)
                } else {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 20)
                }
            }.padding(.trailing, 20)
           
            
            Text(imageText)
                .font(.system(size: 18, weight: .semibold))
        }
       
    }
}

struct PaymentLabel_Previews: PreviewProvider {
    static var previews: some View {
        PaymentLabel(imageName: "LogoParenthing", imageText: "Parenthing", isCustom: true)
    }
}
