import SwiftUI

struct TestingView: View {
    
    var body: some View {
        Image("freePikWallpaper")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 300)
                    
                    
            )
    }
}



struct Previews_TestGround_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
