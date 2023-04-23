import SwiftUI

extension UIImage {
    
    func toBase64() -> String? {
        guard let uiImage = self.jpegData(compressionQuality: 0.8) else {
            return nil
        }
        return uiImage.base64EncodedString()
    }
}


