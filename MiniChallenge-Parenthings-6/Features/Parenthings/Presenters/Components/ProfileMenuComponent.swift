//
//  ProfileMenuComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 02/05/23.
//

import SwiftUI

struct ProfileMenuComponent: View {
    // Celine
    var imageName: String
    var imageText: String
    
    // celine was here
    var body: some View {
        
        VStack (alignment: .leading){
            Button {
                print()
            } label: {
                ImageLabel(imageName: imageName, imageText: imageText, isCustom: false)
                    .padding(.leading, 10)
            }
            .foregroundColor(.black)
        
            Divider()
                .background(.black)
        }
        .padding(.top, 8)
    }
}

struct ProfileMenuComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMenuComponent(imageName: "ticket.fill", imageText: "Ticket")
    }
}
