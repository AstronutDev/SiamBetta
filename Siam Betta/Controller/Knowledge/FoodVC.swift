//
//  FoodVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 11/3/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import FSPagerView

class FoodVC: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate  {

    var completedFoodArr = ["Cfood1","Cfood2","Cfood3"]
    var naturalFoodArr = ["nfood1","nfood2","nfood3"]
    
    @IBOutlet weak var pageControllOne: FSPageControl!{
        didSet {
        self.pageControllOne.numberOfPages = self.completedFoodArr.count
        self.pageControllOne.contentHorizontalAlignment = .left
        self.pageControllOne.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.pageControllOne.hidesForSinglePage = true
        self.pageControllOne.itemSpacing = 13
        }
    }
    
    @IBOutlet weak var pageControllTwo: FSPageControl!{
        didSet {
        self.pageControllTwo.numberOfPages = self.completedFoodArr.count
        self.pageControllTwo.contentHorizontalAlignment = .left
        self.pageControllTwo.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.pageControllTwo.hidesForSinglePage = true
        self.pageControllTwo.itemSpacing = 13
        }
    }
    
    @IBOutlet weak var completedFood: FSPagerView!{
        didSet {
            self.completedFood.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var naturalFoodView: FSPagerView!{
        didSet{
            self.naturalFoodView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FoodCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        if pagerView == completedFood{
            self.pageControllOne.currentPage = targetIndex
        }
        else {
            self.pageControllTwo.currentPage = targetIndex
        }
        
    }
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return completedFoodArr.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if pagerView == completedFood{
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            cell.imageView?.image = UIImage(named: self.completedFoodArr[index])
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true
            return cell
        }
        else{
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FoodCell", at: index)
            cell.imageView?.image = UIImage(named: self.naturalFoodArr[index])
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true
            return cell
        }
    }
    
    @IBAction func backDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
