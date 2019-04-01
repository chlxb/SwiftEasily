//
//  Array+Common.swift
//  vision
//
//  Created by lxb on 2019/3/21.
//  Copyright © 2019 liuxiaobing. All rights reserved.
//

import Foundation


public extension Array {
    public func index(of compare: (Element) -> Bool, failed: (() -> Void)? = nil) -> Int? {
        var index: Int?
        for (idx, item) in self.enumerated() where compare(item) {
            index = idx
            break
        }
        if index == nil {
            failed?()
        }
        return index
    }
    
    func element(in index: Int) -> Element? {
        return (0..<count).contains(index) ? self[index] : nil
    }
}
