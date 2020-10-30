//
//  WebViewLink3VC.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 11/4/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import WebKit
class WebViewLink3VC: UIViewController {

    @IBOutlet weak var webview3: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://il.mahidol.ac.th/e-media/siam-fighting-fish/disease.html")
        
            let request = URLRequest(url: url!)
            webview3.load(request)
    }
}
