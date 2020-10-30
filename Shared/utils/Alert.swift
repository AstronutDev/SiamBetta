//
//  Alert.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 1/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
