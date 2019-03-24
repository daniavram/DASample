//
//  UIColorExtension.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

// colors and names taken from https://materialuicolors.co
fileprivate extension UIColor {
    // MARK: - Hex values - Common
    
    static var blue500: UIColor { return .init(hexString: "#2196F3") }
    static var green500: UIColor { return .init(hexString: "#4CAF50") }
    static var red600: UIColor { return .init(hexString: "#E53935") }
    static var amber500: UIColor { return .init(hexString: "#FFC107") }
    static var lightGreen500: UIColor { return .init(hexString: "#8BC34A") }
    static var blueGray100: UIColor { return .init(hexString: "#CFD8DC") }
}

extension UIColor {
    static var primary: UIColor { return .blue500 }
    static var primaryHighlighted: UIColor { return UIColor.blue500.lighten(by: -30) }
    static var secondary: UIColor { return .green500 }
    static var secondaryHighlighted: UIColor { return UIColor.green500.lighten(by: -30) }
    static var error: UIColor { return .red600 }
    static var warning: UIColor { return .amber500 }
    static var success: UIColor { return .lightGreen500 }
    static var background: UIColor { return .white }
    static var lightBackground: UIColor { return .blueGray100 }
}

extension UIColor {
    // MARK: - Init
    
    convenience init(hexString: String) {
        let start = hexString.index(hexString.startIndex, offsetBy: hexString.hasPrefix("#") ? 1 : 0)
        var hex = String(hexString[start...])
        hex += hex.count == 6 ? "FF" : ""
        
        assert(hex.count == 8, "Please provide a valid hex string")
        
        var hexNumber: UInt64 = 0
        let scanner = Scanner(string: hex)
        scanner.scanHexInt64(&hexNumber)
        
        let redValue = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
        let greenValue = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
        let blueValue = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
        let alphaValue = CGFloat(hexNumber & 0x0000_00FF) / 255
        
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
    
    // MARK: - Color alterators
    
    func lighten(by percentage: Int) -> UIColor {
        var hueValue: CGFloat = 0
        var saturationValue: CGFloat = 0
        var brightnessValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        
        guard getHue(&hueValue, saturation: &saturationValue, brightness: &brightnessValue, alpha: &alphaValue) else { return self }
        
        if brightnessValue < 1.0 {
            let newB: CGFloat = max(min(brightnessValue + (CGFloat(percentage) / 100.0) * brightnessValue, 1.0), 0.0)
            return UIColor(hue: hueValue, saturation: saturationValue, brightness: newB, alpha: alphaValue)
        } else {
            let newS: CGFloat = min(max(saturationValue - (CGFloat(percentage) / 100.0) * saturationValue, 0.0), 1.0)
            return UIColor(hue: hueValue, saturation: newS, brightness: brightnessValue, alpha: alphaValue)
        }
    }
}
