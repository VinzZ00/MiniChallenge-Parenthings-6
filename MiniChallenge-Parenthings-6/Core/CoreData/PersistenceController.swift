//
//  PersistenceController.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 05/05/23.
//

import Foundation
import CoreData
 
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
 
    init() {
        container = NSPersistentContainer(name: "CoreDataModel")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
