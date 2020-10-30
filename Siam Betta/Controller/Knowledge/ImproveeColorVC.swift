//
//  ImproveeColorVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 16/3/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import YouTubePlayer
import FSPagerView

class ImproveeColorVC: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate  {
    
    var imgArr = ["c2","c1","c3"]
    
    fileprivate var alignmentIndex = 0 {
        didSet {
            self.pageControll.contentHorizontalAlignment = .right
        }
    }

    @IBOutlet weak var youtubeView: YouTubePlayerView!
    
    @IBOutlet weak var pageControll: FSPageControl!{
        didSet {
            self.pageControll.numberOfPages = self.imgArr.count
            self.pageControll.contentHorizontalAlignment = .center
            self.pageControll.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.pageControll.hidesForSinglePage = true
            self.pageControll.itemSpacing = 13
        }
    }
    
    @IBOutlet weak var cpagerView: FSPagerView!{
        didSet {
            self.cpagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeView.loadVideoID("YR1EBfxVQ1E")
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
           self.pageControll.currentPage = targetIndex
    }
    
   public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imgArr.count
   }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            cell.imageView?.image = UIImage(named: self.imgArr[index])
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true
            return cell
    }
  
    @IBAction func backDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
