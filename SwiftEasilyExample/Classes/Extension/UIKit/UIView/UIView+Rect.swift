//
//  UIView+Common.swift
//  vision
//
//  Created by lxb on 2019/3/21.
//  Copyright © 2019 liuxiaobing. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    var e_x: CGFloat {
        get {
            return self.frame.minX
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var e_y: CGFloat {
        get {
            return self.frame.minY
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var e_width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var e_height: CGFloat {
        get {
            return self.frame.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
}

public extension CGRect {
    var e_x: CGFloat {
        get {
            return self.minX
        }
        set {
            self.origin.x = newValue
        }
    }
    
    var e_y: CGFloat {
        get {
            return self.minY
        }
        set {
            self.origin.y = newValue
        }
    }
    
    var e_width: CGFloat {
        get {
            return self.width
        }
        set {
            self.size.width = newValue
        }
    }
    
    var e_height: CGFloat {
        get {
            return self.height
        }
        set {
            self.size.height = newValue
        }
    }

    
}
