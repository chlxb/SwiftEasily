//
//  VTUtils.swift
//  vision
//
//  Created by lxb on 2019/3/23.
//  Copyright © 2019 liuxiaobing. All rights reserved.
//

import Foundation
import UIKit

public enum DeviceVersion {
    case Iphone5Early, Iphone5OrSE, Iphone6After, IphonePlus, IphoneX, Unknown
}

public func deviceVersion() -> DeviceVersion {
    if screenHeight == 812 { return .IphoneX }
    if screenHeight == 736 { return .IphonePlus }
    if screenHeight == 667 { return .Iphone6After }
    if screenHeight == 568 { return .Iphone5OrSE }
    if screenHeight <  568 { return .Iphone5Early }
    return .Unknown
}

public func safeBottomMargin() -> CGFloat {
    if deviceVersion() == .IphoneX { return 34 }
    return 0
}

public func safeTopMargin() -> CGFloat {
    if deviceVersion() == .IphoneX { return 44 }
    return 0
}

public func safeNavigationHeight() -> CGFloat {
    if deviceVersion() == .IphoneX { return 88 }
    return 64
}



