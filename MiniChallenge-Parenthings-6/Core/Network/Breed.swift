//
//  Breed.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 02/05/23.
//

import Foundation

struct Breed: Codable, CustomStringConvertible, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let breedExplaination: String
    let energyLevel: Int
    let isHairless: Bool
    
    var description: String {
        return "breed with name: \(name) and id \(id), energy level: \(energyLevel) isHairless: \(isHairless ? "YES" : "NO")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
    }
    
    init(name: String, id: String, explaination: String, temperament: String,
         energyLevel: Int, isHairless: Bool){
        self.name = name
        self.id = id
        self.breedExplaination = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.isHairless = isHairless
    }
    
 
    static func example1() -> Breed {
        return Breed(name: "Abyssinian",
                     id: "abys",
                     explaination: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                     temperament: "Active, Energetic, Independent, Intelligent, Gentle",
                     energyLevel: 5,
                     isHairless: false)
        
    }
    
    static func example2() -> Breed {
        return Breed(name: "Cyprus",
                     id: "cypr",
                     explaination: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.",
                     temperament: "Affectionate, Social",
                     energyLevel: 4,
                     isHairless: false)
        
    }
}

