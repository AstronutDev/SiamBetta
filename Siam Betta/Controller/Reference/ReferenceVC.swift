//
//  ReferenceVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 11/4/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit

class ReferenceVC: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setBtn1() {
        btn1.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btn1.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn1.layer.shadowOpacity = 1.0
        btn1.layer.shadowRadius = 0.0
        btn1.layer.masksToBounds = false
    }
    
    func setBtn2() {
        btn2.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btn2.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn2.layer.shadowOpacity = 1.0
        btn2.layer.shadowRadius = 0.0
        btn2.layer.masksToBounds = false
    }
    
    func setBtn3() {
        btn3.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btn3.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn3.layer.shadowOpacity = 1.0
        btn3.layer.shadowRadius = 0.0
        btn3.layer.masksToBounds = false
    }

    @IBAction func backPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
