//
//  NewsDetailViewController.swift
//  CitrixAssignment
//
//  Created by Stanly Johnson on 10/06/22.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var newsDetailWebView: UIView!
    
    // MARK: - Properties
    var externalURL: String?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWidgetWebView(externalurl: externalURL)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationbar()
    }
    
    func setupNavigationbar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.isNavigationBarHidden = false
    }
    
    func loadWidgetWebView(externalurl: String?) {
        let configuration = WKWebViewConfiguration()
        let wkWebView = WKWebView(frame: newsDetailWebView.frame, configuration: configuration)
        wkWebView.navigationDelegate = self
        wkWebView.scrollView.showsVerticalScrollIndicator = false
        wkWebView.scrollView.showsHorizontalScrollIndicator = false
        newsDetailWebView.addSubview(wkWebView)
        if let externalurl = externalurl, let url = URL(string: externalurl) {
            wkWebView.load(URLRequest(url: url))
        }
    }
}

// MARK: - Extension WKNavigation Delegate
extension NewsDetailViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        INTLoadingIndicator.shared.dismiss()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        INTLoadingIndicator.shared.dismiss()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        // if the loading URL is the request URL for webView
        var action: WKNavigationActionPolicy?
        do {
            decisionHandler(action ?? .allow)
        }
    }
}
