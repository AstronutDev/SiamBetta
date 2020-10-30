//
//  CategoryCell.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 4/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var fishNameLabel: UILabel!
    @IBOutlet weak var fishImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    
    private func setupUI() {
        fishImage.layer.cornerRadius = 5
    }
    
    func configureCell(category: Category) {
        fishNameLabel.text = category.name
        if let url = URL(string: category.imgUrl) {
            fishImage.kf.setImage(with: url)
        }
    }
}
