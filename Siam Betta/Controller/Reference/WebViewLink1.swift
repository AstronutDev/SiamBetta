//
//  WebViewLink1.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 11/4/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import WebKit

class WebViewLink1: UIViewController {
    
    @IBOutlet weak var webView2: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.thbetta.com/category/%e0%b8%84%e0%b8%a7%e0%b8%b2%e0%b8%a1%e0%b8%a3%e0%b8%b9%e0%b9%89%e0%b9%80%e0%b8%81%e0%b8%b5%e0%b9%88%e0%b8%a2%e0%b8%a7%e0%b8%81%e0%b8%b1%e0%b8%9a%e0%b8%9b%e0%b8%a5%e0%b8%b2%e0%b8%81%e0%b8%b1%e0%b8%94/")
        let request = URLRequest(url: url!)
        webView2.load(request)
    }
}
