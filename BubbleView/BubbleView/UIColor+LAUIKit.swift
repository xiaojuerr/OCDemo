//
//  UIColor.swift
//  BubbleView
//
//  Created by Theo on 2024/8/27.
//


import UIKit


extension UIColor {
    static func lazColor(hex: String) -> UIColor? {
        var hexString = hex
        if hexString.hasPrefix("#") {
            hexString = String(hexString.dropFirst())
        }
        var rgbValue: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&rgbValue) else { return nil }
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
