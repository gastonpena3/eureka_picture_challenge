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
    
    var context = CoreDataManager.shared.persistentContainer.viewContext
    @StateObject var locationManager = LocationManager()
    @Published var photos: [Photo] = []
    
    var defaultImage: UIImage = UIImage(systemName: "photo") ?? UIImage()
    
    //Update Photos Array
    func updatePhotoStoreData() {
        
        photos = getStorePhotos()
    }
    
    //Get Photos Store in Core Data
    func getStorePhotos() -> [Photo] {
        
        let request: NSFetchRequest<Photo> = NSFetchRequest(entityName: "Photo")
        
        do {
            let photos: [Photo] = try context.fetch(request)
            
            return photos
        } catch {
            return []
        }
    }
    
    //Validate if User has Store Photos
    func hasStorePhotos() -> Bool {
        
        return getStorePhotos().count > 0 ? true : false
    }
    
    //Save new photo in Photos Data Base
    func saveImage(selectedImage: UIImage, latitude: Double, longitude: Double) {
        
        let photo = Photo(context: context)
        photo.image = selectedImage
        photo.latitude = latitude
        photo.longitude = longitude
        
        try? self.context.save()
    }
}
