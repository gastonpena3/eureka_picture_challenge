//
//  PictureView.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI

struct PictureView: View {
    
    var screen = UIScreen.main.bounds
    var image: UIImage
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: screen.width / 2, height: screen.width / 2)
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
            .padding()
    }
}

struct PictureView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PictureView(image: UIImage(systemName: "photo") ?? UIImage())
    }
}
