//
//  BreedVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 18/3/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import YouTubePlayer

class BreedVC: UIViewController {
    
    @IBOutlet weak var breedYoutubeView: YouTubePlayerView!
    
    @IBOutlet weak var minionYoutubeView: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        breedYoutubeView.loadVideoID("YA2kUYZj2qQ")
        minionYoutubeView.loadVideoID("WWAnnaLVrsM")
    }
    
    @IBAction func backDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
