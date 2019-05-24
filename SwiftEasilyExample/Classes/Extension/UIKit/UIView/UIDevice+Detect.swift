//
//  UIDevice+Common.swift
//  SwiftEasilyExample
//
//  Created by lxb on 2019/3/28.
//  Copyright © 2019 lxb. All rights reserved.
//

import Foundation
import UIKit

let kLXBScreenWidth = UIScreen.main.bounds.lxb_width
let kLXBScreenHeight = UIScreen.main.bounds.lxb_height

public extension UIDevice {
    public enum LXBDeviceVersion {
        case Iphone5Early, Iphone5OrSE, Iphone6After, IphonePlus, IphoneXSeries, Unknown
    }
    
    public func deviceVersion() -> LXBDeviceVersion {
        if UIDevice.isX_Series { return LXBDeviceVersion.IphoneXSeries }
        if kLXBScreenHeight == 736 { return LXBDeviceVersion.IphonePlus }
        if kLXBScreenHeight == 667 { return LXBDeviceVersion.Iphone6After }
        if kLXBScreenHeight == 568 { return LXBDeviceVersion.Iphone5OrSE }
        if kLXBScreenHeight <  568 { return LXBDeviceVersion.Iphone5Early }
        return LXBDeviceVersion.Unknown
    }
    
    /// 是否 X 系列 （刘海屏）
    static var isX_Series: Bool {
        return Machine.isX_Series
    }
    
    static var modelName: String {
        return Machine.modelName
    }
    
    private struct Machine {
        static var isX_Series: Bool = {
            guard #available(iOS 11, *) else {
                return false
            }
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror.init(reflecting: systemInfo.machine)
            let identifier = machineMirror.children.reduce("") { (identifier, element) in
                guard let value = element.value as? Int8, value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
            if ["i386", "Simulator x86"].contains(identifier) {
                 return ["iPhone X", "iPhone XR", "iPhone XS", "iPhone XS Max"].contains(UIDevice.current.name)
            }
            let x_seriesDic = [
                "iPhone10,3": "iPhone X",
                "iPhone10,6": "iPhone X",
                "iPhone11,2": "iPhone XS",
                "iPhone11,4": "iPhone XS Max",
                "iPhone11,6": "iPhone XS Max",
                "iPhone11,8": "iPhone XR",
                ]
            return x_seriesDic[identifier] != nil
        }()
        
        static var modelName: String = {
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror.init(reflecting: systemInfo.machine)
            let identifier = machineMirror.children.reduce("") { (identifier, element) in
                guard let value = element.value as? Int8, value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
            let modelDic: Dictionary<String, String> = [
                // watch
                "Watch1,1" : "Apple Watch 38mm",
                "Watch1,2" : "Apple Watch 42mm",
                "Watch2,3" : "Apple Watch Series 2 38mm",
                "Watch2,4" : "Apple Watch Series 2 42mm",
                "Watch2,6" : "Apple Watch Series 1 38mm",
                "Watch1,7" : "Apple Watch Series 1 42mm",
                
                // iPod
                "iPod1,1" : "iPod touch 1",
                "iPod2,1" : "iPod touch 2",
                "iPod3,1" : "iPod touch 3",
                "iPod4,1" : "iPod touch 4",
                "iPod5,1" : "iPod touch 5",
                "iPod7,1" : "iPod touch 6",
                
                // iPhone
                "iPhone1,1" : "iPhone 1G",
                "iPhone1,2" : "iPhone 3G",
                
                "iPhone2,1" : "iPhone 3GS",
                
                "iPhone3,1" : "iPhone 4 (GSM)",
                "iPhone3,2" : "iPhone 4",
                "iPhone3,3" : "iPhone 4 (CDMA)",
                
                "iPhone4,1" : "iPhone 4S",
                
                "iPhone5,1" : "iPhone 5",
                "iPhone5,2" : "iPhone 5",
                "iPhone5,3" : "iPhone 5c",
                "iPhone5,4" : "iPhone 5c",
                
                "iPhone6,1" : "iPhone 5s",
                "iPhone6,2" : "iPhone 5s",
                
                "iPhone7,1" : "iPhone 6 Plus",
                "iPhone7,2" : "iPhone 6",
                
                "iPhone8,1" : "iPhone 6s",
                "iPhone8,2" : "iPhone 6s Plus",
                "iPhone8,4" : "iPhone SE",
                
                "iPhone9,1" : "iPhone 7",
                "iPhone9,2" : "iPhone 7 Plus",
                "iPhone9,3" : "iPhone 7",
                "iPhone9,4" : "iPhone 7 Plus",
                
                "iPhone10,1": "iPhone 8",
                "iPhone10,4": "iPhone 8",
                "iPhone10,2": "iPhone 8 Plus",
                "iPhone10,5": "iPhone 8 Plus",
                "iPhone10,3": "iPhone X",
                "iPhone10,6": "iPhone X",
                
                "iPhone11,2": "iPhone XS",
                "iPhone11,4": "iPhone XS Max",
                "iPhone11,6": "iPhone XS Max",
                "iPhone11,8": "iPhone XR",
                
                // iPad
                "iPad1,1" : "iPad 1",
                "iPad2,1" : "iPad 2 (WiFi)",
                "iPad2,2" : "iPad 2 (GSM)",
                "iPad2,3" : "iPad 2 (CDMA)",
                "iPad2,4" : "iPad 2",
                "iPad3,1" : "iPad 3 (WiFi)",
                "iPad3,2" : "iPad 3 (4G)",
                "iPad3,3" : "iPad 3 (4G)",
                "iPad3,4" : "iPad 4",
                "iPad3,5" : "iPad 4",
                "iPad3,6" : "iPad 4",
                "iPad6,11": "iPad (9.7)",
                "iPad6,12": "iPad (9.7)",
                "iPad7,6":  "iPad (9.7 2018)",
                "iPad7,5":  "iPad (9.7 2018)",
                // iPad mini
                "iPad2,5" : "iPad mini 1",
                "iPad2,6" : "iPad mini 1",
                "iPad2,7" : "iPad mini 1",
                "iPad4,4" : "iPad mini 2",
                "iPad4,5" : "iPad mini 2",
                "iPad4,6" : "iPad mini 2",
                "iPad4,7" : "iPad mini 3",
                "iPad4,8" : "iPad mini 3",
                "iPad4,9" : "iPad mini 3",
                "iPad5,1" : "iPad mini 4",
                "iPad5,2" : "iPad mini 4",
                "iPad11,1": "iPad mini 5",
                "iPad11,2": "iPad mini 5",
                // iPad Air
                "iPad4,1" : "iPad Air",
                "iPad4,2" : "iPad Air",
                "iPad4,3" : "iPad Air",
                "iPad5,3" : "iPad Air 2",
                "iPad5,4" : "iPad Air 2",
                "iPad11,3": "iPad Air 3",
                "iPad11,4": "iPad Air 3",
                // iPad Pro
                "iPad6,3" : "iPad Pro (9.7 inch)",
                "iPad6,4" : "iPad Pro (9.7 inch)",
                "iPad6,7" : "iPad Pro (12.9 inch)",
                "iPad6,8" : "iPad Pro (12.9 inch)",
                "iPad7,1" : "iPad Pro 2 (12.9 inch)",
                "iPad7,2" : "iPad Pro 2 (12.9 inch)",
                "iPad7,3" : "iPad Pro 2 (10.5 inch)",
                "iPad7,4" : "iPad Pro 2 (10.5 inch)",
                "iPad8,1" : "iPad Pro 3 (11 inch)",
                "iPad8,2" : "iPad Pro 3 (11 inch)",
                "iPad8,3" : "iPad Pro 3 (11 inch)",
                "iPad8,4" : "iPad Pro 3 (11 inch)",
                "iPad8,5" : "iPad Pro 3 (12.9 inch)",
                "iPad8,6" : "iPad Pro 3 (12.9 inch)",
                "iPad8,7" : "iPad Pro 3 (12.9 inch)",
                "iPad8,8" : "iPad Pro 3 (12.9 inch)",
                
                // AppleTV
                "AppleTV2,1" : "Apple TV 2",
                "AppleTV3,1" : "Apple TV 3",
                "AppleTV3,2" : "Apple TV 3",
                "AppleTV5,3" : "Apple TV 4",
                
                // Simulator
                "i386" : "Simulator x86",
                "x86_64" : "Simulator x64",
                ]
            return modelDic[identifier] ?? identifier
        }()
    }
}

public extension UIDevice {
    

    
    
}

