import SwiftUI

//struct ShimmerView: View {
//    @State private var isAnimating: Bool = false
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 8)
//            .fill(LinearGradient(gradient: Gradient(colors: [.gray, .white, .gray]), startPoint: .leading, endPoint: .trailing))
//            .frame(width: 200, height: 20)
//            .mask(Text("Shimmer").font(.headline).fontWeight(.bold))
//            .onAppear {
//                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)) {
//                    self.isAnimating = true
//                }
//            }
//            .opacity(isAnimating ? 1 : 0.3)
//    }
//}

struct ShimmerView: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.gray, .white, .gray]),
                    startPoint: .init(x: -0.3, y: 0.5),
                    endPoint: .init(x: 1.3, y: 0.5)
                )
            )
            .frame(width: 200, height: 20)
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                    self.isAnimating = true
                }
            }
            .opacity(isAnimating ? 1 : 0.3)
    }
}

struct ShimmerView2: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(
                (isAnimating) ? AppColor.red
                : AppColor.gradientColorBottomRight
//                (isAnimating) ?
//
//                LinearGradient(
//                    gradient: Gradient(colors: [.gray, .white, .gray]),
//                    startPoint: .init(x: -0.3, y: 0.5),
//                    endPoint: .init(x: 1.3, y: 0.5)
//                )
//
//                :
//
//                LinearGradient(
//                    gradient: Gradient(colors: [.white, .gray, .white]),
//                    startPoint: .init(x: -0.3, y: 0.5),
//                    endPoint: .init(x: 1.3, y: 0.5)
//                )
            )
            .frame(width: 200, height: 20)
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.isAnimating = true
                }
            }
//            .opacity(isAnimating ? 1 : 0.3)
    }
}

//struct LinearAnimation: View {
//    @State private var isAnimating = false
//
//    var body: some View {
//        VStack{
//            LinearGradient(
//                gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]),
//                startPoint: .leading,
//                endPoint: .trailing
//            )
//            .frame(height: 10)
//            .cornerRadius(5)
//            .offset(x: isAnimating ? UIScreen.main.bounds.width : -20, y: 0)
//            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
//            .onAppear {
//                self.isAnimating = true
//            }
//        }.background(
//            LinearGradient(
//                gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]),
//                startPoint: .leading,
//                endPoint: .trailing
//            )
//        )
//    }
//}

struct MovingGradient: View {
    @State private var isAnimating = false
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.black, .blue, .purple]),
            startPoint: .leading,
            endPoint: .trailing
        )
//        .offset(x : (isAnimating) ? 0 : 0)
        .frame(width: 800, height: 200)
        .mask(
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
//                .rotationEffect(.degrees(0))
        )
        .animation(
            Animation.linear(duration: 1)
                .repeatForever(autoreverses: true)
        )
        .onAppear() {
            self.isAnimating = true
        }
    }
}


struct MovingGradient2: View {
    @State private var offset = CGSize(width: -300, height: 0)
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .frame(width: 200, height: 200)
        .mask(
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
                .rotationEffect(.degrees(45))
        )
        .offset(offset)
        .animation(
            Animation.linear(duration: 2.0)
                .repeatForever(autoreverses: false)
        )
        .onAppear() {
            self.offset = CGSize(width: 300, height: 0)
        }
    }
}



struct Previews_TestingScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MovingGradient()
    }
}
