import SwiftUI

struct ContentViews: View {
    
    var expertViewModel : ExpertViewModel  = ExpertViewModel()
    
    var body: some View {
        VStack{
            ForEach(expertViewModel.experts, id : \.self) {
                exp in
                Text("exp")
            }
        }.onAppear{
            expertViewModel.getAllExpert()
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
