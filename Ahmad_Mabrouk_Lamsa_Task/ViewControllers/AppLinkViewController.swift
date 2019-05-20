//
//  AppLinkViewController.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import UIKit

class AppLinkViewController: BaseViewController , UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
    }
    
    func loadUrl() {
        
        if NetworkStatus.sharedInstance.isConnected {
            let Url = URL(string: url)
            let request = URLRequest(url: Url!)
            webView.loadRequest(request)
            webView.delegate = self
        } else {
            Globals.showBasicAlert(title: "Error", message: "No internet connection", vc: self)
        }
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Sucsess")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        Globals.showBasicAlert(title: "Error", message: error.localizedDescription, vc: self)
    }

}
