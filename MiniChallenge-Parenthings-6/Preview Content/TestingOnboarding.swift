import SwiftUI

struct OnboardingPage: View {
    @State private var currentPage = 0
    
    let onboardingData: [(imageName: String, title: String, description: String)] = [
        ("onboarding1", "Title 1", "Description 1"),
        ("onboarding2", "Title 2", "Description 2"),
        ("onboarding3", "Title 3", "Description 3")
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<onboardingData.count) { index in
                    let item = onboardingData[index]
                    OnboardingCardView(imageName: item.imageName, title: item.title, description: item.description)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
//            Button(action: {
//                if currentPage < onboardingData.count - 1 {
//                    currentPage += 1
//                } else {
//                    // End of onboarding, dismiss the page
//                }
//            }) {
//                Text(currentPage == onboardingData.count - 1 ? "Get Started" : "Next")
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .cornerRadius(10)
//            .padding()
            
            HStack {
                ForEach(0..<onboardingData.count, id : \.self) { idx in
                    Button {
                        currentPage = idx
                    } label : {
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct OnboardingCardView: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct ContentViewOnboarding: View {
    @State private var showOnboarding = true
    
    var body: some View {
        ZStack {
            if showOnboarding {
                OnboardingPage()
                    .transition(.slide)
            } else {
                Text("Hello, world!")
            }
        }
        .onTapGesture {
            showOnboarding = false
        }
    }
}


struct Previews_TestingOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOnboarding()
    }
}
