//
//  UIcolor.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 2/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let Offwhite = UIColor(hex: 0xeaebee)
    static let OceanBlue = UIColor(hex: 0x289bbd)
    static let LightPink = UIColor(hex: 0xea6998)
    static let LightViolet = UIColor(hex: 0x8d91dd)
    static let LightOrange = UIColor(hex: 0xf5a373)
    static let DarkViolet = UIColor(hex: 0x5B2C6F )
    static let DarkYellow = UIColor(hex: 0xFFC300 )
    static let OffBlue = UIColor(hex: 0x09263D)
    
    
    convenience init(red: Int, green: Int, blue: Int, a:CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(hex: Int, a:CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 0) & 0xFF,
        blue: hex & 0xFF,
        a: a
        )
    }
}
