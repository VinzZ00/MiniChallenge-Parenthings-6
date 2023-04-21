import SwiftUI

struct GradientNavigationBar: View {
    let gradientColors: [Color]
    let title: String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientColors),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                           .frame(height: 80)
                           .ignoresSafeArea()
            HStack {
                Button(action: {
                    // Pop this view from the navigation stack
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
                .padding(.leading, 16)
                Spacer()
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.trailing, 16)
            }
            .frame(height: 44)
            .padding(.top, 20)
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
}

struct ContentView_Preview   : PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Hello!")
//                .navigationBarHidden(true)
                .background(GradientNavigationBar(gradientColors: [Color.red, Color.blue], title: "Title"))
        }
    }
}
