//
//  CameraCoordinator.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import UIKit
import Photos

class CameraCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var camera: CameraManager
    
    init(picker: CameraManager) {
        self.camera = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.camera.selectedImage = selectedImage

        self.camera.isPresented.wrappedValue.dismiss()
    }
    
}
