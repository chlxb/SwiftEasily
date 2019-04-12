//
//  UIColor+Common.swift
//  SwiftEasilyExample
//
//  Created by lxb on 2019/4/1.
//  Copyright © 2019 lxb. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let divisor: CGFloat = 255.0
        let r = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let g = CGFloat((hex & 0x00FF00) >> 8) / divisor
        let b = CGFloat(hex & 0x0000FF) / divisor
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    public convenience init(hexRGBA: UInt32) {
        let divisor: CGFloat = 255
        let r = CGFloat((hexRGBA & 0xFF000000) >> 24) / divisor
        let g = CGFloat((hexRGBA & 0x00FF0000) >> 16) / divisor
        let b = CGFloat((hexRGBA & 0x0000FF00) >> 8) / divisor
        let a = CGFloat(hexRGBA & 0x000000FF ) / divisor
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    public convenience init(rgba: String) throws {
        var hex: String = rgba
        if rgba.hasPrefix("#") {
            hex =  String(rgba[rgba.index(rgba.startIndex, offsetBy: 1)...])
        } else if rgba.hasPrefix("0x") || rgba.hasPrefix("0X") {
            hex =  String(rgba[rgba.index(rgba.startIndex, offsetBy: 2)...])
        }
        var hexValue : UInt32 = 0
        let scanner = Scanner(string: hex)
        guard scanner.scanHexInt32(&hexValue) else {
            let error = UIColorError(.scanHexValueError, origin: rgba)
            throw error
        }
        switch hex.count {
        case 6:
            self.init(hex: hexValue)
        case 8:
            self.init(hexRGBA: hexValue)
        default:
            let error = UIColorError(.stringLenghtError, origin: rgba)
            throw error
        }
    }
    
    public convenience init(_ r: CGFloat, _ g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    public static func RGB(_ r: CGFloat, _ g: CGFloat, b: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

class UIColorError: Error {
    public enum ColorErrorType {
        case scanHexValueError, stringLenghtError
    }
    
    private var type: ColorErrorType!
    private var origin: String = ""
    init(_ type: ColorErrorType, origin: String) {
        self.type = type
        self.origin = origin
    }
    
    
    var localizedDescription: String {
        switch self.type {
        case .scanHexValueError?:
            return "\(origin) can not scan to hex value"
        case .stringLenghtError?:
            return "\(origin)'s length mismatched"
        default:
            return "Undefined error"
        }
    }
    
}
