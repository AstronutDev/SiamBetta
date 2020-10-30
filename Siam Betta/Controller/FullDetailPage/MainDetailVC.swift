//
//  MainDetailVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 4/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit
import Firebase

class MainDetailVC: UIViewController {
    
    
    //var
    var categories = [Category]()
    var selectCategory: Category!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: Identifiers.CategoryCell, bundle: nil), forCellWithReuseIdentifier: Identifiers.CategoryCell)
        fetchCollection()
    }
    

    func fetchCollection() {
        let collectionRef = Firestore.firestore().collection("discovery")
        collectionRef.getDocuments { (snap, error) in
            guard let documents = snap?.documents else {return}
            for document in documents {
                let data = document.data()
                let newCategory = Category.init(data: data)
                self.categories.append(newCategory)
                self.collectionView.reloadData()
            }
            
        }
    }
}

extension MainDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.CategoryCell, for: indexPath) as? CategoryCell {
            cell.configureCell(category: categories[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let cellWidth = (width - 50) / 2
        let cellHeight = cellWidth * 1.5

        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(identifier: "EachFishVC") as! EachFishVC
        
        desVC.image = categories[indexPath.row].imgUrl
        desVC.fishName = categories[indexPath.row].name
        desVC.detail = categories[indexPath.row].detail
        
        desVC.bodyImageUrl = categories[indexPath.row].bodyImageUrl
        desVC.bodyDetail = categories[indexPath.row].bodyDetail
        
        desVC.backFinImageUrl = categories[indexPath.row].backFinImage
        desVC.backFinDetail = categories[indexPath.row].backFinDetail
    
        desVC.paunchFinImageUrl = categories[indexPath.row].paunchFinImage
        desVC.paunchFinDetail = categories[indexPath.row].paunchFinDetail
        
        desVC.tailFinImageUrl = categories[indexPath.row].tailFinImage
        desVC.tailFinDetail = categories[indexPath.row].tailFinDetail
        
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
