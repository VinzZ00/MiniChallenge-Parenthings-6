//
//  JsonFileOpener.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 02/05/23.
//

import Foundation

struct JsonFileOpener {
    
    func open(){
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                print("jsonResult \(jsonResult)")

                //decoder still in wrong function, need to fix it ASAP
                    let json = try! JSONSerialization.data(withJSONObject: jsonResult )
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let breeds = try!
                    decoder.decode([Breed].self, from: json)
                    print("decoded: \(breeds)")

                
                
            } catch {
                // handle error
                print("error :\(error.localizedDescription)")
            }
        }
    }
    
}
