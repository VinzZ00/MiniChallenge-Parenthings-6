import SwiftUI

struct SlideshowScrollView<Content: View>: View {
    let content: Content
    @State private var currentIndex = 0
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        ScrollViewReader { scrollView in
            GeometryReader { proxy in
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            content
                        }
                        .animation(.easeInOut(duration: 0.5))
                        .onAppear{
                            scrollToInitialSlide();
                        }
                        .onChange(of: currentIndex) { index in
                            scrollView.scrollTo(index, anchor: .center)
                        }
                    }
                    
                    HStack(spacing: 8) {
                        ForEach(0..<contentCount(), id: \.self) { index in
                            Circle()
                                .fill(index == currentIndex ? Color.black : Color.gray)
                                .frame(width: 16, height: 16)
                                
                        }
                    }
                }
            }
        }
    }
        
        
//        GeometryReader { geometry in
//            VStack {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 0) {
//                        content
//                    }
//                    .frame(width: geometry.size.width * CGFloat(contentCount()))
//                    .offset(x: -CGFloat(currentIndex) * geometry.size.width, y: 0)
//                    .animation(.easeInOut(duration: 0.5))
//                }
//                .frame(width: geometry.size.width, height: geometry.size.height)
//
//                HStack(spacing: 8) {
//                    ForEach(0..<contentCount(), id: \.self) { index in
//                        Circle()
//                            .fill(index == currentIndex ? Color.white : Color.gray)
//                            .frame(width: 8, height: 8)
//                            .onTapGesture {
//                                withAnimation {
//                                    currentIndex = index
//                                }
//                            }
//                    }
//                }
//            }
//            .onReceive(timer) { _ in
//                currentIndex = (currentIndex + 1) % contentCount()
//            }
//        }
//    }
    
    private func scrollToInitialSlide() {
        DispatchQueue.main.async {
            withAnimation {
                currentIndex = 0
            }
        }
    }
    
    private func contentCount() -> Int {
        // Return the number of views in the content
        // For example, if the content is an array of images, return the count of the array
        return 2;
    }
}

struct previewScrollTesting: View {
    var body: some View {
        SlideshowScrollView {
            Image("UniversalPlaceHolder")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Image("UniversalPlaceHolder")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Image("UniversalPlaceHolder")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        }
        .frame(height: 200)
    }
}


struct Previews_TestGround_Previews: PreviewProvider {
    static var previews: some View {
        previewScrollTesting()
    }
}
