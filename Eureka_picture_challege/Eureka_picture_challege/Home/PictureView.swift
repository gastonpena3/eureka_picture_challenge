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
            .cornerRadius(5)
            .border(Color.black)
            .frame(width: screen.width / 3, height: screen.width / 3)
            .padding(.all, 5)
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(image: UIImage(systemName: "photo") ?? UIImage())
    }
}
