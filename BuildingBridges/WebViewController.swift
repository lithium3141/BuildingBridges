//
//  WebViewController.swift
//  BuildingBridges
//
//  Created by Tim Ekl on 2017.11.08.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    var url: URL! {
        didSet {
            guard isViewLoaded else { return }
            loadURL()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()
    }
    
    private func loadURL() {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}
