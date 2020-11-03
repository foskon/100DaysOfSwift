//
//  ViewController.swift
//  HWS-WebView
//
//  Created by Carlos Manzanas Navia on 3/11/20.
//  Copyright © 2020 foskon. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet private var webView: WKWebView!
    
    static func instantiate() -> WebViewController {
        UIStoryboard(name: "WebView", bundle: nil)
            .instantiateViewController(identifier: "WebViewController") as WebViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(onOpenTouch))
    }
    
    @objc func onOpenTouch() {
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    @objc func openPage(_ action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
