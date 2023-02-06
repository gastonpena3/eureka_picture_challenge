//
//  HomeView.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI
import CoreData

struct HomeView: View {

    @ObservedObject var viewModel = PhotoViewModel()
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var showNextPage = false
    
    var defaultImage: UIImage = UIImage(systemName: "photo") ?? UIImage()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        if viewModel.hasStorePhotos() {
                            ForEach(viewModel.getStorePhotos()) { photo in
                                HStack {
                                    //ForEach(0..<3) { index in
                                        NavigationLink(destination: {
                                            PhotoDetail(selectedImage: (selectedImage ?? defaultImage))
                                        }, label: {
                                            PictureView(image: photo.image as? UIImage ?? defaultImage)
                                        })
                                    //}
                                    
                                }
                            }
                        } else {
                
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100)
                                .padding(.top, 50)
                                .foregroundColor(Color.red)
                            
                            Text("You haven´t take any picture yet!")
                                .font(.headline).bold()
                                .foregroundColor(Color.red)
                                .padding()
                        }
                        
                    }
                    
                    Spacer()
                    Button(action: {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }, label: {
                        
                        HStack(alignment: .center) {
                            Image(systemName: "camera")
                                .padding(.trailing, 10)
                                .foregroundColor(Color.white)
                            Text("Take Picture!")
                                .font(Font.custom("Roboto-Bold", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                        }
                        
                    })
                    .frame(width: UIScreen.main.bounds.size.width - 44, height: 62)
                    .background(Color.red) // If you have this
                    .cornerRadius(5)
                    .shadow(color: Color.red.opacity(0.5), radius: 15, x: 0, y: 0)
                    
                }
                
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.red, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitle("Eureka Photo Data")
            
            .sheet(isPresented: self.$isImagePickerDisplay, onDismiss: {
                if let image = selectedImage {
                    showNextPage.toggle()
                }
            }) {
                CameraManager(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            
            NavigationLink(destination: PhotoDetail(selectedImage: selectedImage ?? UIImage()), isActive: $showNextPage) {}
            
        }.accentColor(.white) 

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

