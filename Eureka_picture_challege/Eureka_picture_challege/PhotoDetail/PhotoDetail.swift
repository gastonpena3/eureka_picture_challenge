//
//  SwiftUIView.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI

struct PhotoDetail: View {

    @ObservedObject private var viewModel = PhotoViewModel()

    private var selectedImage: UIImage
    private var selectedImageLatitude: Double
    private var selectedImageLongitude: Double
    
    private var isNewPhoto = false
    
    init(selectedImage: UIImage, selectedImageLatitude: Double, selectedImageLongitude: Double, isNewPhoto: Bool) {
        
        self.selectedImage = selectedImage
        self.selectedImageLatitude = selectedImageLatitude
        self.selectedImageLongitude = selectedImageLongitude
        self.isNewPhoto = isNewPhoto
    }

    var body: some View {
        ZStack {
            
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Image(uiImage: self.selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.width - 80)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.5), radius: 15, x: 0, y: 0)
                    .padding(.bottom, 10)
                
                GoogleMapsView(latitude: selectedImageLatitude, longitude: selectedImageLongitude)
                    .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.width - 80)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.5), radius: 15, x: 0, y: 0)
                    .padding()
            }
            
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.red, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        .onAppear() {
            
            if isNewPhoto {
                
                viewModel.saveImage(selectedImage: selectedImage, latitude: Double(viewModel.locationManager.latitude), longitude: Double(viewModel.locationManager.longitude))
                viewModel.updatePhotoStoreData()
            }
        }
    }

}

