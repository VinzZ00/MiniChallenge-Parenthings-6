//import SwiftUI
//
//struct contentView4 : View {
//
//    var body: some View {
//
//    }
//}
import SwiftUI

struct ContentView4: View {
    @State private var showModal = false
    
    var body: some View {
        Button("Show Modal") {
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            VStack {
                Text("This is a modal view.")
                Spacer()
            }
            .frame(width: 300, height: 200)
        }
    }
}


struct Previews_hiddenTabBar_Testing_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4();
    }
}
