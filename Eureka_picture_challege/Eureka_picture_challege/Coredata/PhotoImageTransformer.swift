//
//  PhotoImageTransformer.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import Foundation
import UIKit

class PhotoImageTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let image = value as? UIImage else { return nil }
        
        do {
            let data = try? NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
            return data
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        
        guard let data = value as? Data else { return nil }
        
        do {
            let image = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return image
        }
    }
}
