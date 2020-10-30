//
//  GradintbgVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 13/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit

class GradintbgVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.OceanBlue.cgColor, UIColor.Offwhite.cgColor]
        newLayer.frame = view.frame
        
        mainView.layer.addSublayer(newLayer)
    }
    

   

}
