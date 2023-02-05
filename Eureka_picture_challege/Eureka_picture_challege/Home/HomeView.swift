//
//  HomeView.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var selectedImageData: [UIImagePickerController.InfoKey: Any]?
    @State private var isImagePickerDisplay = false
    @State private var showNextPage = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(items) { item in
                            HStack {
                                NavigationLink(destination: {
                                    //print("OPEN IMAGE")
                                    PictureView()
                                }, label: {
                                    PictureView().onTapGesture {
                                        print("PICTURE TAP")
                                    }
                                })
                            }
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
                    print("IMAGE TAKEN")
                    showNextPage.toggle()
                }
            }) {
                CameraManager(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            
            NavigationLink(destination: PictureDetail(selectedImage: selectedImage ?? UIImage()), isActive: $showNextPage) {}
            
        }.accentColor(.white) 

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

