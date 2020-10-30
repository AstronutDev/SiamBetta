//
//  EachFishVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 6/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit
import Kingfisher


class EachFishVC: UIViewController {

    var category: Category!
    var image = ""
    var fishName = ""
    var detail = ""
    
    var bodyDetail = ""
    var bodyImageUrl = ""
    
    var backFinImageUrl = ""
    var backFinDetail = ""
    
    var paunchFinImageUrl = ""
    var paunchFinDetail = ""
    
    var tailFinImageUrl = ""
    var tailFinDetail = ""
    
    
    @IBOutlet weak var fishNameLabel: UILabel!
    @IBOutlet weak var fishImageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var bodyImageView: UIImageView!
    
    @IBOutlet weak var bodyDetailLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var backFinImageView: UIImageView!
    @IBOutlet weak var backFinDetailLabel: UILabel!
    
    
    @IBOutlet weak var paunchFinImageView: UIImageView!
    @IBOutlet weak var paunchFinDetailLabel: UILabel!
    
    
    @IBOutlet weak var tailFinImageView: UIImageView!
    @IBOutlet weak var tailFinDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.black.cgColor, UIColor.OffBlue.cgColor]
        newLayer.frame = view.frame
        bodyImageView.layer.cornerRadius = 5
        backFinImageView.layer.cornerRadius = 5
        paunchFinImageView.layer.cornerRadius = 5
        tailFinImageView.layer.cornerRadius = 5
        detailView.layer.addSublayer(newLayer)
        setUI()
    }

    private func setUI() {

        // main image
        if let url = URL(string: image) {
            fishImageView.kf.setImage(with: url)
        }
        
        //body image
        if let url = URL(string: bodyImageUrl) {
            bodyImageView.kf.setImage(with: url)
        }
        
        //backFin image
        if let url = URL(string: backFinImageUrl) {
            backFinImageView.kf.setImage(with: url)
        }
        backFinDetailLabel.text = self.backFinDetail
        
        //paunchFin image
        if let url = URL(string: paunchFinImageUrl) {
            paunchFinImageView.kf.setImage(with: url)
        }
        paunchFinDetailLabel.text = self.paunchFinDetail
        
        //taikFin image
        if let url = URL(string: tailFinImageUrl) {
            tailFinImageView.kf.setImage(with: url)
        }
        tailFinDetailLabel.text = self.tailFinDetail
   
        
        detailLabel.text = detail
        bodyDetailLabel.text = bodyDetail
        fishNameLabel.text = fishName
    }
    
    @IBAction func backDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }  
}
