//
//  UIImageView+Extensions.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 17/11/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(url: String) {
        guard let urlString = URL(string: "https://image.tmdb.org/t/p/w500"),
              let urlImage = URL(string: "\(urlString)/\(url)") else { return }
        
        
        if let imageData = try? Data(contentsOf: urlImage) {
            if let loadedImage = UIImage(data: imageData) {
                self.image = loadedImage
            }
        }
    }
}
