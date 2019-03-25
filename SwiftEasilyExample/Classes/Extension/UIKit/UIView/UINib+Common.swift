//
//  UINib+Common.swift
//  vision
//
//  Created by lxb on 2019/3/23.
//  Copyright © 2019 liuxiaobing. All rights reserved.
//

import Foundation
import UIKit


extension UINib {
    public static func loadNib(_ fileName: String, bundle: Bundle? = nil) -> UINib {
        let ret: UINib = UINib(nibName: fileName, bundle: bundle)
        return ret
    }
}
