//
//  SubTitleText.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 02/05/23.
//

import SwiftUI

struct SubTitleText: View {
    var title: String
    var body: some View {
        HStack(){
            Text("\(title)")
                .font(.system(size: 22, weight: .bold))
                .padding(.leading, 18)
            Spacer()
        }.padding(.bottom, 6)
    }
}

struct SubTitleText_Previews: PreviewProvider {
    static var previews: some View {
        SubTitleText(title: "This is Sub Title")
    }
}
