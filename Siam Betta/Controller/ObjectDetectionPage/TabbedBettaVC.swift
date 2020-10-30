//
//  TempVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 26/1/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher
import FSPagerView

class TabbedBettaVC: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    
    var imageName: [String] = []
    var fishName = ""
    var db = Firestore.firestore()
    var selectCategory: Category!
    var categories = [Category]()
    
    fileprivate var alignmentIndex = 0 {
            didSet {
                self.pageControll.contentHorizontalAlignment = .right
            }
    }
    
    @IBOutlet weak var fishNameView: UIView!
    @IBOutlet weak var retryView: UIView!
    @IBOutlet weak var fowardView: UIView!
    @IBOutlet weak var fishNameLabel: UILabel!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    
    
    @IBOutlet weak var pageControll: FSPageControl!{
        didSet {
            self.pageControll.numberOfPages = 3
            self.pageControll.contentHorizontalAlignment = .left
            self.pageControll.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.pageControll.hidesForSinglePage = true
            self.pageControll.itemSpacing = 13
        }
    }

    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var fishDetailLabel: UILabel!
    
    override func viewDidLad() {
        super.viewDidLoad()
        setUpShadow()
        fetchDocument()
        self.fishNameLabel.text = fishName
        fetchCollection()
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        DispatchQueue.main.async(execute: {
            self.pageControll.currentPage = targetIndex
            self.pagerView.reloadData()
        })
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageName.count
        
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        for i in 0...4 {
            if let url = URL(string: self.imageName[index]) {

                cell.imageView?.kf.setImage(with: url)
            }
        }
        
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func setUpShadow () {
        retryBtn.layer.cornerRadius = 15
        retryBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        retryView.layer.cornerRadius = 15
        retryView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        forwardBtn.layer.cornerRadius = 15
        forwardBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        fowardView.layer.cornerRadius = 15
        fowardView.layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    func fetchDocument () {
        if self.fishName == "Bigear Betta" {
            let docRef = db.collection("categories").document("BigearBetta")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else { return }
                let fishDetail = data["detail"] as! String ?? ""
                self.fishDetailLabel.text = fishDetail
                self.imageName.append(data["imageUrl1"] as! String)
                self.imageName.append(data["imageUrl2"] as! String)
                self.imageName.append(data["imageUrl3"] as! String)
                DispatchQueue.main.async(execute: {
                    self.pagerView.reloadData()
                })
            }
        }
        
        else if self.fishName == "Crowntail Betta" {
            let docRef = db.collection("categories").document("CrownTail")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else { return }
                let fishDetail = data["detail"] as! String ?? ""
                self.fishDetailLabel.text = fishDetail
                self.imageName.append(data["imageUrl1"] as! String)
                self.imageName.append(data["imageUrl2"] as! String)
                self.imageName.append(data["imageUrl3"] as! String)
                DispatchQueue.main.async(execute: {
                    self.pagerView.reloadData()
                })
            }
        }
        
        else if self.fishName == "Doubletail Betta" {
            let docRef = db.collection("categories").document("DoubleTail")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else { return }
                let fishDetail = data["detail"] as! String ?? ""
                self.fishDetailLabel.text = fishDetail
                self.imageName.append(data["imageUrl1"] as! String)
                self.imageName.append(data["imageUrl2"] as! String)
                self.imageName.append(data["imageUrl3"] as! String)
                DispatchQueue.main.async(execute: {
                    self.pagerView.reloadData()
                })
            }
        }
            
        else if self.fishName == "Halfmoon Betta" {
            let docRef = db.collection("categories").document("Halfmoon")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else {return}
                let fishDetail = data["detail"] as! String ?? ""
                self.fishDetailLabel.text = fishDetail
                
                self.imageName.append(data["imageUrl1"] as! String)
                self.imageName.append(data["imageUrl2"] as! String)
                self.imageName.append(data["imageUrl3"] as! String)
                DispatchQueue.main.async(execute: {
                    self.pagerView.reloadData()
                })
            }
        }
        
        else if self.fishName == "Viltail Betta" {
            let docRef = db.collection("categories").document("Viltail")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else { return }
                let fishDetail = data["detail"] as! String ?? ""
                self.imageName.append(data["imageUrl1"] as! String)
                self.imageName.append(data["imageUrl2"] as! String)
                self.imageName.append(data["imageUrl3"] as! String)
                self.fishDetailLabel.text = fishDetail
                
                DispatchQueue.main.async(execute: {
                    self.pagerView.reloadData()
                })
            }
        }
            
        else if self.fishName == "Wild Betta" {
            let docRef = db.collection("categories").document("WildBetta")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else { return }
                let fishDetail = data["detail"] as! String ?? ""
                self.fishDetailLabel.text = fishDetail
                self.imageName.append(data["imageUrl1"] as! String)
                self.imageName.append(data["imageUrl2"] as! String)
                self.imageName.append(data["imageUrl3"] as! String)
                self.fishDetailLabel.text = fishDetail
                
                DispatchQueue.main.async(execute: {
                    self.pagerView.reloadData()
                })
            }
        }
    }
    
    func fetchCollection() {
        let collectionRef = Firestore.firestore().collection("discovery")
        collectionRef.getDocuments { (snap, error) in
            guard let documents = snap?.documents else {return}
            for document in documents {
                let data = document.data()
                let newCategory = Category.init(data: data)
                self.categories.append(newCategory)
            }
        }
    }
    
    @IBAction func didTabRetry(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapGo(_ sender: Any) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(identifier: "EachFishVC") as! EachFishVC
        
        if (fishName == "Bigear Betta") {
              checkSpecies(0)
        }
        
        else if (fishName == "Crowntail Betta") {
                checkSpecies(1)
        }
        
        else if (fishName == "Doubletail Betta") {
                checkSpecies(2)
        }
        
        else if (fishName == "Halfmoon Betta") {
                checkSpecies(3)
        }
        
        else if (fishName == "Viltail Betta") {
                checkSpecies(4)
        }
        
        else {
                checkSpecies(5)
        }
    }
    
    func checkSpecies(_ fishIndex: Int) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(identifier: "EachFishVC") as! EachFishVC
        desVC.image = categories[fishIndex].imgUrl
        desVC.fishName = categories[fishIndex].name
        desVC.detail = categories[fishIndex].detail
            
        desVC.bodyImageUrl = categories[fishIndex].bodyImageUrl
        desVC.bodyDetail = categories[fishIndex].bodyDetail
            
        desVC.backFinImageUrl = categories[fishIndex].backFinImage
        desVC.backFinDetail = categories[fishIndex].backFinDetail
        
        desVC.paunchFinImageUrl = categories[fishIndex].paunchFinImage
        desVC.paunchFinDetail = categories[fishIndex].paunchFinDetail
            
        desVC.tailFinImageUrl = categories[fishIndex].tailFinImage
        desVC.tailFinDetail = categories[fishIndex].tailFinDetail
        
        self.navigationController?.pushViewController(desVC, animated: true)
        present(desVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEachFishSegue" {
            if let destination = segue.destination as? EachFishVC {
                destination.category = selectCategory
            }
        }
    }
}
