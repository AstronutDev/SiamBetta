//
//  PetVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 18/3/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import YouTubePlayer
import FSPagerView

class PetVC: UIViewController , FSPagerViewDataSource, FSPagerViewDelegate{
    
    var plantpet = ["p1", "p2", "p3"]
    
    fileprivate var alignmentIndex = 0 {
            didSet {
                self.pageControll.contentHorizontalAlignment = .right
        }
    }

    @IBOutlet weak var youtubeView: YouTubePlayerView!
    
    @IBOutlet weak var pageView: FSPagerView!{
        didSet{
            self.pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var pageControll: FSPageControl!{
        didSet {
            self.pageControll.numberOfPages = self.plantpet.count
            self.pageControll.contentHorizontalAlignment = .left
            self.pageControll.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.pageControll.hidesForSinglePage = true
            self.pageControll.itemSpacing = 13
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeView.loadVideoID("KmWwgGL_kVE")
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControll.currentPage = targetIndex
    }

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return plantpet.count
     }
     
     func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
         let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
         cell.imageView?.image = UIImage(named: self.plantpet[index])
         cell.imageView?.contentMode = .scaleAspectFill
         cell.imageView?.clipsToBounds = true
         return cell
     }
    
    @IBAction func backDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
