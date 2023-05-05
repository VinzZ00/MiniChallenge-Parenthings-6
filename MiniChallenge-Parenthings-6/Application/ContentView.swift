//
//  ContentView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 20/04/23.
//

import SwiftUI

struct ContentView: View {
    let persistenceController = PersistenceController.shared

    var body: some View {
        HomeRootView().preferredColorScheme(.light)
            .environment(\.managedObjectContext,
                                        persistenceController.container.viewContext)
//        SignInPopUP()
//        ChatExpert();
//        ContentView4();
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
