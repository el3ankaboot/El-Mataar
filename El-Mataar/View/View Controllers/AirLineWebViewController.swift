//
//  AirLineWebViewController.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 04/10/2021.
//

import WebKit

class AirLineWebViewController: BaseViewController,WKNavigationDelegate {
    
    //MARK:- Variables
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    //MARK:- Injection
    var url: String!
    
    //MARK:- Life cycle
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        addProgressBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !url.hasPrefix("https://"){
            url = "https://\(url ?? "")"
        } //Because it is returned from backend without https (This piece of code is not added generally)
        
        let urlOptional = URL(string: url)
        guard let webUrl = urlOptional else {
            self.showErrorAlert()
            return
        }
        webView.load(URLRequest(url: webUrl))
        webView.allowsBackForwardNavigationGestures = true
    }

    
    //MARK:- WebKit Delegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        hideProgressBar()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.showErrorAlert()
        hideProgressBar()
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.showErrorAlert()
        hideProgressBar()
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == K.estimatedProgress {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    //MARK:- Progress bar
    func addProgressBar(){
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        progressView.tintColor = .init(named: K.airLinesRed)
        progressView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 5)
        webView.addSubview(progressView)
    }
    
    func hideProgressBar(){
        progressView.isHidden = true
    }
}

