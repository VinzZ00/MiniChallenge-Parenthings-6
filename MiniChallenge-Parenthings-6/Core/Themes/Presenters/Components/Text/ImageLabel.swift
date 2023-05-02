//
//  ImageLabel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 02/05/23.
//

import SwiftUI

struct ImageLabel: View {
    var imageName: String
    var imageText: String
    var isCustom: Bool
    
    var body: some View {
        HStack{
            if(isCustom){
                Image(imageName)
                    
            } else {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 14)
            }
                
            
            if (imageText != "") {
                Text(imageText)
                    .font(.system(size: 17, weight: .bold))
            }
        }
    }
}

struct ImageLabel_Previews: PreviewProvider {
    static var previews: some View {
       ImageLabel(imageName: "ticket.fill", imageText: "Ticket", isCustom: false)
    }
}
