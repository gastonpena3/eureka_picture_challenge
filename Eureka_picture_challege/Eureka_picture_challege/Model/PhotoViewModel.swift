//
//  PhotoViewModel.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class PhotoViewModel: ObservableObject {
    
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    func getStorePhotos() -> [Photo] {
        
        let request: NSFetchRequest<Photo> = NSFetchRequest(entityName: "Photo")
        
        do {
            let photos: [Photo] = try context.fetch(request)
            
            return photos
        } catch {
            return []
        }
    }
    
    func hasStorePhotos() -> Bool {
        return getStorePhotos().count > 0 ? true : false
    }
}
