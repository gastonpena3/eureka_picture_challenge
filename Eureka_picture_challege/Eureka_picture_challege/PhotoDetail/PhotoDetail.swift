//
//  SwiftUIView.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI

struct PhotoDetail: View {
    
    //private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    @ObservedObject var viewModel = PhotoViewModel()
    
    @StateObject var locationManager = LocationManager()
    @State private var selectedImage: UIImage
    
    private var isNewPhoto = false
    
    init(selectedImage: UIImage, isNewPhoto: Bool) {
        self.selectedImage = selectedImage
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
                
                GoogleMapsView()
                    .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.width - 80)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.5), radius: 15, x: 0, y: 0)
                    .padding()
            }
            
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.red, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        .onDisappear() {
            if isNewPhoto {
                viewModel.saveImage(selectedImage: selectedImage, latitude: Float(locationManager.latitude), longitude: Float(locationManager.longitude))
            }
        }
    }

}

