//
//  UIColor+Extensions.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 16/11/22.
//

import Foundation
import UIKit

extension UIColor {
    static let darkPurple = UIColor.rgb(red: 46, green: 19, blue: 113)

    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
