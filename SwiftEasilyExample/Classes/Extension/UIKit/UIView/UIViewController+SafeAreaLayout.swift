//
//  UIViewController+SafeLayout.swift
//  SwiftEasilyExample
//
//  Created by lxb on 2019/3/28.
//  Copyright © 2019 lxb. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    
    static public func safeBottomMargin() -> CGFloat {
        if UIDevice.current.deviceVersion() == .IphoneXSeries { return 34 }
        return 0
    }
    
    static public func safeTopStatusMargin() -> CGFloat {
        if UIDevice.current.deviceVersion() == .IphoneXSeries { return 44 }
        return 20
    }
    
    static public func safeNavigationHeight() -> CGFloat {
        if UIDevice.current.deviceVersion() == .IphoneXSeries { return 88 }
        return 64
    }
    
    static public func safeBottomHeight() -> CGFloat {
        return self.safeBottomMargin() + 49
    }
    
}
