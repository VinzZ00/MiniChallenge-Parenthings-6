
import SwiftUI

struct ContentViews3: View {
    
    @State var isHidden = true
    
    var body: some View {
        TabView {
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
            // Add another tab here
            NavigationView{
                HomeView()
                if true {
                    NavigationLink("", destination: HiddenTabView(), isActive: $isHidden)
                }
                
            }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home View")
    }
}

struct SettingsView: View {
    
    
    var body: some View {
        VStack{
            Text("Setting View")
        }
        .background(.red)
            
    }
}

struct HiddenTabView: View {
    var body: some View {
        // Your hidden tab view content here
        Text("Hidden tab bar view")
    }
    
    init() {
        // Hide the tab bar item for this view
        UITabBar.appearance().isHidden = true
    }
}

struct Previews_TestingOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews3()
    }
}


