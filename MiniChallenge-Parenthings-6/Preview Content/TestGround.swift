import SwiftUI

//struct SlideshowScrollView<Content: View>: View {
//    let content: Content
//    @State private var currentIndex = 0
//
//    init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
//
//    var body: some View {
//
//        ScrollViewReader { scrollView in
//            GeometryReader { proxy in
//                VStack {
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 0) {
//                            content
//                        }
//                        .animation(.easeInOut(duration: 0.5))
//                        .onAppear{
//                            scrollToInitialSlide();
//                        }
//                        .onChange(of: currentIndex) { index in
//                            scrollView.scrollTo(index, anchor: .center)
//                        }
//                    }
//
//                    HStack(spacing: 8) {
//                        ForEach(0..<contentCount(), id: \.self) { index in
//                            Circle()
//                                .fill(index == currentIndex ? Color.black : Color.gray)
//                                .frame(width: 16, height: 16)
//
//                        }
//                    }
//                }
//            }
//        }
//    }
//

//struct RoundedSegmentedControl: View {
//    @State private var selectedSegment = 0
//    
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedSegment, label: Text("")) {
//                Text("First").tag(0)
//                Text("Second").tag(1)
//                Text("Third").tag(2)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding(.horizontal, 20)
//            .padding(.vertical, 8)
//            .background(Color.gray.opacity(0.2))
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .padding(.horizontal, 20)
//        }
//    }
//}
        
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
//}
//
//struct previewScrollTesting: View {
//    var body: some View {
//        SlideshowScrollView {
//            Image("UniversalPlaceHolder")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 200)
//            Image("UniversalPlaceHolder")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 200)
//            Image("UniversalPlaceHolder")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 200)
//        }
//        .frame(height: 200)
//    }
//}

//struct testingPick


//struct Previews_TestGround_Previews: PreviewProvider {
//    static var previews: some View {
//        RoundedSegmentedControl();
//    }
//}
