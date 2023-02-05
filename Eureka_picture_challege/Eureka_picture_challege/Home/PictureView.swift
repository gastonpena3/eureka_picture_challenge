//
//  PictureView.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI

struct PictureView: View {
    
    var screen = UIScreen.main.bounds
    var body: some View {
        Image(systemName: "photo")
            .cornerRadius(5)
            .border(Color.black)
            .frame(width: screen.width / 3, height: screen.width / 3)
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView()
    }
}
