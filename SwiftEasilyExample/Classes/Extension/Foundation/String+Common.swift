//
//  String+Common.swift
//  SwiftEasilyExample
//
//  Created by lxb on 2019/3/29.
//  Copyright © 2019 lxb. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    public func boundindgRect(with size: CGSize, options: NSStringDrawingOptions, attributes: [NSAttributedString.Key: Any]?, context: NSStringDrawingContext?) -> CGRect {
        return (self as NSString).boundingRect(with: size, options: options, attributes: attributes, context: context)
    }
    
    public func draw(in rect: CGRect, with attributes: [NSAttributedString.Key: Any]?) {
        (self as NSString).draw(in: rect, withAttributes: attributes)
    }
}
