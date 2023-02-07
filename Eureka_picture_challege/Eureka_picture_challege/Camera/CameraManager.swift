//
//  ImagePickerView.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import UIKit
import SwiftUI

struct CameraManager: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    
    @Environment(\.presentationMode) var isPresented
    
    var sourceType: UIImagePickerController.SourceType
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .photoLibrary
        } else {
            picker.sourceType = .camera
        }
        
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> CameraCoordinator {
        
        return Coordinator(picker: self)
    }
}
