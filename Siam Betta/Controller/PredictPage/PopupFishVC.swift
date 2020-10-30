//
//  PopupFishVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 31/10/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher
import TCProgressBar
import Charts

class PopupFishVC: UIViewController{
    
    var predictFish: String = "defalut text"
    var secPredictFish: String = ""
    var thirdPredictFish: String = ""
    var predictPercen: Double = 0.0
    var secPredictPercen: Double = 0.0
    var thirdPredictPercen: Double = 0.0
    var takePhotoImage: UIImage!
    var imageFirebase: String = ""
    var db = Firestore.firestore()
    var parties = ["other"]
    var predictData = [1.0]

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var predictLabel: UILabel!

    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBOutlet weak var imageFromTaking: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!

    @IBOutlet weak var descriptionFishDetailView: UIView!
    @IBOutlet weak var predictFishnameView: UIView!
    @IBOutlet weak var progressBarView: UIView!

    @IBOutlet weak var progressView: TCProgressBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        parties.append(predictFish)
        parties.append(secPredictFish)
        predictData.append(predictPercen - 1)
        predictData.append(secPredictPercen * 100)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchDocument()
        setUp()
        self.setChart(3, range: 100)
    }

    func setUp() {
        predictLabel.text = predictFish
        imageFromTaking.image = takePhotoImage
        setupView()
    }
    // setUP about View
    func setupView() {
        descriptionFishDetailView.layer.cornerRadius = 6
        descriptionFishDetailView.layer.shadowColor = UIColor.black.cgColor
        descriptionFishDetailView.layer.shadowOpacity = 0.4
        descriptionFishDetailView.layer.shadowOffset = CGSize.zero
        descriptionFishDetailView.layer.shadowRadius = 4
    }

    private func setRoundedImg() {
        imageFromTaking.layer.cornerRadius = 10
        imageFromTaking.clipsToBounds = true
        imageFromTaking.layer.borderColor = AppColors.Offwhite.cgColor
        imageFromTaking.layer.borderWidth = 1
    }
    
    func fetchDocument() {
        //case 1 - bigear
        if self.predictFish == "BigearBetta" {
            let docRef = db.collection("categories").document("BigearBetta")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else {return}
                let detail = data["detail"] as! String ?? ""
                self.detailLabel.text = detail
            }
        }

        //case 2 - crowntail
        else if self.predictFish == "CrowntailBetta" {
            let docRef = db.collection("categories").document("CrownTail")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else {return}
                let detail = data["detail"] as! String ?? ""
                self.detailLabel.text = detail
            }
        }

        //case 3 - doubletail
        else if self.predictFish == "DoubletailBetta" {
            let docRef = db.collection("categories").document("DoubleTail")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else {return}
                let detail = data["detail"] as! String ?? ""
                self.detailLabel.text = detail
            }
        }

        //case 4 - halfmoon
        else if self.predictFish == "HalfmoonBetta" {
            let docRef = db.collection("categories").document("Halfmoon")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else {return}
                let detail = data["detail"] as! String ?? ""
                self.detailLabel.text = detail
            }
        }

        //case 5 - viltail
        else if self.predictFish == "ViltailBetta" {
            let docRef = db.collection("categories").document("Viltail")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else {return}
                let detail = data["detail"] as! String ?? ""
                self.detailLabel.text = detail
            }
        }

        //case 6 - wild
        else if self.predictFish == "WildBetta" {
            let docRef = db.collection("categories").document("WildBetta")
            docRef.getDocument { (snap, error) in
                guard let data = snap?.data() else {return}
                let detail = data["detail"] as! String ?? ""
                self.detailLabel.text = detail
            }
        }

        else {
            print("not feteching")
        }

    }
    
    func setChart(_ count: Int, range: UInt32) {
            let entries = (0..<count).map { (i) -> PieChartDataEntry in
                return PieChartDataEntry(value: predictData[i],
                label: parties[i % parties.count])
            }
            
            let set = PieChartDataSet(entries: entries, label: "")
            set.sliceSpace = 0
            
            let colors = [UIColor(hexFromString: "#F1C40F" ), UIColor(hexFromString: "#E74C3C"), UIColor(hexFromString: "#3498DB")]
            set.colors = colors as! [NSUIColor]
                [UIColor(red: 255/255, green: 181/255, blue: 229/255, alpha: 0)]
            set.valueLinePart1OffsetPercentage = 0.6
            set.valueLinePart1Length = 0.6
            set.valueLinePart2Length = 0.6
            set.yValuePosition = .outsideSlice
            let data = PieChartData(dataSet: set)
            let pFormatter = NumberFormatter()
            pFormatter.numberStyle = .percent
            pFormatter.maximumFractionDigits = 1
            pFormatter.multiplier = 1
            pFormatter.percentSymbol = " %"
            data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
            data.setValueFont(.systemFont(ofSize: 11, weight: .bold))
            data.setValueTextColor(.blue)
            
            pieChartView.data = data
            pieChartView.highlightValues(nil)
    }
    
    @IBAction func cancelDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
