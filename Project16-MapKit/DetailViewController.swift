//
//  DetailViewController.swift
//  Project16-MapKit
//
//  Created by Matteo Orru on 09/05/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var capital: Capital?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let capital = capital else { return }
        
        let urlString = "https://en.wikipedia.org/wiki/" + capital.wiki
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    
}
