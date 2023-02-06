//
//  CoreDataManager.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        
        ValueTransformer.setValueTransformer(PhotoImageTransformer(), forName: NSValueTransformerName("PhotoImageTransformer"))
        
        self.persistentContainer = NSPersistentContainer(name: "PhotoModel")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Error trying to initialize Core Data: \(error)")
            }
        }
    }
}
