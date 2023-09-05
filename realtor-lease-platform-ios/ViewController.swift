//
//  ViewController.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2022/6/6.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKScriptMessageHandler  {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    
    let url = Constants.SERVER_URL
    var factory : Factory? = nil
    var webView: WKWebView? = nil
    var controlModel: Model? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        initObject()
        initGUI()
        // Do any additional setup after loading the view.
    }
    
    func initObject() {
        factory = Factory()
        controlModel = factory?.createModel()
        controlModel?.setFactory(factory: factory!)
        controlModel?.setViewController(ViewController: self)
    }
    
    func initGUI() {
        
        let contentController = WKUserContentController();
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.websiteDataStore = WKWebsiteDataStore.default()
        self.webView = WKWebView(
                    frame: CGRect(x:0, y:20, width: self.view.frame.width, height:self.view.frame.height-20),
                    configuration: config
                )
        self.view.addSubview(self.webView!)
//        controlModel?.changePage(webView: webView ?? WKWebView(), page: Constants.NETWORK_ERROR_PAGE_NAME)
        controlModel?.changePage(webView: webView ?? WKWebView(), page: Constants.SERVER_PAGE_NAME)
        
    }

}

