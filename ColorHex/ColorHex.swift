//
//  ColorHex.swift
//  SwiftTools
//
//  Created by 提运佳 on 2018/6/19.
//  Copyright © 2018年 提运佳. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Formats a hex color string to UIColor. If empty, Black. If invalid, White.
    ///
    /// - Parameters: #00FFFF
    ///   - hexString: web-format hex color string "#FF2A1A" or "FF2A1A"
    ///   - alpha: default 1.0
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var resultHexString = hexString
        if resultHexString.hasPrefix("#") {
            resultHexString.remove(at: resultHexString.startIndex)
        }

        let scanner = Scanner(string: resultHexString)
        scanner.charactersToBeSkipped = CharacterSet.alphanumerics.inverted
        
        var value: UInt32 = 0;
        scanner.scanHexInt32(&value)
        
        self.init(hex: value, alpha: alpha)
    }
    
    /// Formats a hex color to UIColor.
    ///
    /// - Parameters:
    ///   - hex: 16-formats 0xe44664
    ///   - alpha: default 1.0
    
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    /// Formats rgb color to UIColor.
    ///
    /// - Parameters:
    ///   - r: CGFloat
    ///   - g: CGFloat
    ///   - b: CGFloat
    ///   - alpha: default 1.0
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0,
            alpha: alpha
        )
    }
}
