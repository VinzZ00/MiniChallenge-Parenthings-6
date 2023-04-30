//
//  AESHelper.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 30/04/23.
//

import Foundation
import SwiftUI
import CryptoKit


struct AESHelp{

    func doEncryptAES(message: String) -> String {
        let secret = ProcessInfo.processInfo.environment["AES_KEY"] ?? ""
        let key = SymmetricKey(data: secret.data(using: .utf8)!)
        let nonce = Data(base64Encoded: ProcessInfo.processInfo.environment["AES_NONCE"] ?? "")
        
        do {
            let plainData = message.data(using: .utf8)
            let sealedData = try AES.GCM.seal(plainData!, using: key,nonce: try AES.GCM.Nonce(data: nonce!))
//            let encryptedContent: Data = try! sealedData.combined!
            
            return sealedData.tag.base64EncodedString() + sealedData.ciphertext.base64EncodedString()
            
        } catch {
            print("Error Encrypt \(error)")
        }
        
        return ""
    }
    
    
    func doDecryptAES(message: String) -> String {
        let secret = ProcessInfo.processInfo.environment["AES_KEY"] ?? ""
        let key = SymmetricKey(data: secret.data(using: .utf8)!)
        let nonce = Data(base64Encoded: ProcessInfo.processInfo.environment["AES_NONCE"] ?? "")
        
        let lowerBound1 = String.Index(utf16Offset: 0, in: message)
        let upperBound1 = String.Index(utf16Offset: 24, in: message)
        
        let lowerBound2 = String.Index(utf16Offset: 24, in: message)
        let upperBound2 = String.Index(utf16Offset: message.count, in: message)

        var tag: Data? = nil
        if let decodedData = Data(base64Encoded: String(message[lowerBound1 ..< upperBound1])) {
            tag = decodedData
        }
        
        var newMsg: Data? = nil
        if let decodedData2 = Data(base64Encoded: String(message[lowerBound2 ..< upperBound2])) {
            newMsg = decodedData2
        }
        
        
        do {
            let sealedBox = try AES.GCM.SealedBox(nonce:  try AES.GCM.Nonce(data: nonce!),
                                                   ciphertext: newMsg!,
                                                   tag:tag!)

            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(decoding: decryptedData, as: UTF8.self)
        } catch {
            print("Error Decrypt \(error)")
        }
        
        return ""
    }
    
}


extension String {
   
    func doEncryptAES() -> String{
        
        return AESHelp().doEncryptAES(message: self)
    }
    
    
    func doDecryptAES() -> String {
        
        return AESHelp().doDecryptAES(message: self)
        
    }
}
