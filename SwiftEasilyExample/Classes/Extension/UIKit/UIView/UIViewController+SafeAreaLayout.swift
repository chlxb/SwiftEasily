//
//  UIViewController+SafeLayout.swift
//  SwiftEasilyExample
//
//  Created by lxb on 2019/3/28.
//  Copyright © 2019 lxb. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public func safeBottomMargin() -> CGFloat {
        if UIDevice.current.deviceVersion() == .IphoneX { return 34 }
        return 0
    }
    
    public func safeTopStatusMargin() -> CGFloat {
        if UIDevice.current.deviceVersion() == .IphoneX { return 44 }
        return 0
    }
    
    public func safeNavigationHeight() -> CGFloat {
        if UIDevice.current.deviceVersion() == .IphoneX { return 88 }
        return 64
    }
    
}
