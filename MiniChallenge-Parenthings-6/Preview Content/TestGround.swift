import SwiftUI

struct ContentViews: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                NavigationLink("Next page", destination: NextView())
            }
            .navigationTitle("My App")
        }
    }
}

struct NextView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("This is the next page")
            Button("Go back") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Next Page")
    }
}


struct Previews_TestGround_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews()
    }
}
