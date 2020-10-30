//
//  restImageVC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 31/10/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit
import Vision
import CoreML

class restImageVC: UIViewController {

    var image: UIImage!
    var myResult = [String]()
    var myPercen = [Double]()
    var predictResult: String = ""
    var secPredictResult: String = ""
    var thirdPredictResult: String = ""

    var predictPercentage: Double = 0.0
    var topClassificationsFish = ""
    var secClassificationsFish = ""
    var thirdClassificationsFish = ""
    
    var topPercen = 0.0
    var secPercen = 0.0
    var thirdPercen = 0.0

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.image
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: VisionmodelSec().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
                self.processClassification(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
            
        } catch {
            fatalError("Failed to load CoreML model: \(error)")
        }
    }()
    
    func processClassification(for request: VNRequest, error: Error?) {
        guard let classification = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if classification.isEmpty {
            
        } else {
            let topClassifications = classification.prefix(1)
            let secClassifications = classification.prefix(2)
            let thirdClassifications = classification.prefix(3)
            
            let descriptions = topClassifications.map { classification -> String in
                predictResult = classification.identifier
                
                print(">>>>> \(secPredictResult)")
                predictPercentage = Double(classification.confidence * 100)
                print("-------->\(predictResult), \(predictPercentage)")
                return String(format: "%.2f", classification.confidence * 100) + "% - " + classification.identifier
            }
            
            let x = secClassifications.map { (classification) -> String in
                secPredictResult = classification.identifier
                myResult.append(classification.identifier)
                myPercen.append(Double(classification.confidence))
                return ""
            }
            
            let y = thirdClassifications.map { (classification) -> String in
                thirdPredictResult = classification.identifier
                myResult.append(classification.identifier)
                myPercen.append(Double(classification.confidence))
                return ""
            }

            self.topClassificationsFish = myResult[0]
            self.secClassificationsFish = myResult[1]
            self.thirdClassificationsFish = myResult[2]
            self.topPercen = myPercen[0]
            self.secPercen = myPercen[1]
            self.thirdPercen = myPercen[2]
        }
    }
    
    func updateClassification(for image: UIImage) {
        
        guard let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue)),
            let ciImage = CIImage(image: image) else {
                return
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
        do {
            try handler.perform([classificationRequest])
            
        } catch {
            print("Fail to perform classification: \(error.localizedDescription)")
        }
        
    }
    
    @IBAction func retryDidTap(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func useDidTap(_ sender: Any) {
        updateClassification(for: image)
        if predictResult == "It's not Betta fish"{
            Alert.showAlert(on: self, with: "", message: "ไม่พบปลากัด")
        } else {
            performSegue(withIdentifier: "toPopupDetailFish", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var popup = segue.destination as! PopupFishVC
        popup.predictFish = self.predictResult
        popup.predictPercen = self.predictPercentage
        popup.takePhotoImage = self.image
        popup.secPredictFish = self.secClassificationsFish
        popup.secPredictPercen = self.secPercen
        popup.thirdPredictFish = self.thirdClassificationsFish
        popup.thirdPredictPercen = self.thirdPercen
    }
}
