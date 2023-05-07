//
//  PaymentTypeViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 07/05/23.
//

import Foundation
class PaymentTypeViewModel : ObservableObject {
    
    @Published var selectedType : TypePayment = .Parenthing;
    
    func getDetails (paymentType : TypePayment) -> PaymentTypeModel {
        var name : String
        var logo : String
        var isLogoCustom : Bool
        var completeLogo : String
        var isCompleteLogoCustom : Bool
        var taxFee : Double
        
        switch paymentType {
            case .Parenthing  :
                name = "Parenthing"
                logo = "LogoParenthing2"
                isLogoCustom = true
                completeLogo = "LogoParenthing"
                isCompleteLogoCustom = true
                taxFee = 100.0
            
            case .GoPay:
                name = "Gopay"
                logo = "Gopay2"
                isLogoCustom = true
                completeLogo = "Gopay"
                isCompleteLogoCustom = true
                taxFee = 200.0

            case .Ovo:
                name = "Ovo"
                logo = "Ovo2"
                isLogoCustom = true
                completeLogo = "Ovo"
                isCompleteLogoCustom = true
                taxFee = 300.0

            case .Dana:
                name = "Dana"
                logo = "Dana2"
                isLogoCustom = true
                completeLogo = "Dana"
                isCompleteLogoCustom = true
                taxFee = 400.0
            
            case .BankTransfer:
                name = "BankTransfer"
                logo = "BankTransfer"
                isLogoCustom = true
                completeLogo = "BankTransfer"
                isCompleteLogoCustom = true
                taxFee = 1500.0
        }
        
        return PaymentTypeModel(name: name, logo: logo, isLogoCustom: isLogoCustom, completeLogo: completeLogo, isCompleteLogoCustom: isCompleteLogoCustom, taxFee: taxFee)
    }
    
}
