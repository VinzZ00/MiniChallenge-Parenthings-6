import SwiftUI;

struct ContentView4: View {
    @State private var isShowingDetail = false
    
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    Button("Go to detail page") {
                        isShowingDetail = true
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .tabItem {
                Label("First", systemImage: "1.circle")
            }

            NavigationView {
                VStack {
                    Text("Second tab")
                }
            }
            .tabItem {
                Label("Second", systemImage: "2.circle")
            }

            NavigationView {
                VStack {
                    Text("Third tab")
                }
            }
            .tabItem {
                Label("Third", systemImage: "3.circle")
            }
        }
        .fullScreenCover(isPresented: $isShowingDetail, onDismiss: {
            // handle sheet dismissed, if necessary
        }) {
            DetailView()
                
        }
    }
}

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Detail page")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
}


struct Previews_hiddenTabBar_Testing_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
