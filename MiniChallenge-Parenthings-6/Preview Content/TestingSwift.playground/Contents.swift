import UIKit
var greeting = "Hello, playground"

extension UIImage {
    
    func toBase64() -> String? {
        guard let uiImage = self.jpegData(compressionQuality: 0.8) else {
            return nil
        }
        return uiImage.base64EncodedString()
    }
}

var number1 = 5;
var x = number1/2;

var y : Double = 100/3
if let imageString : String = UIImage(systemName: "person.fill")?.toBase64() {
    print(imageString)
} else {
    print("ini nil")
}
