//
//  LogoComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 02/05/23.
//

import SwiftUI

struct LogoComponent: View {
    var body: some View {
        VStack {
            Image("LogoParenthing")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 30)
        }
    }
}

struct LogoComponent_Previews: PreviewProvider {
    static var previews: some View {
        LogoComponent()
    }
}
