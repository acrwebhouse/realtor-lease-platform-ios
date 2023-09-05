//
//  Model.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import WebKit

class Model: NSObject {
    var controller: Controller? = nil
    var webView: WKWebView? = nil
    var viewController :UIViewController? = nil
    var factory : Factory? = nil
    
    func setViewController(ViewController:UIViewController)
    {
        viewController = ViewController;
    }
    
    func setFactory(factory:Factory)
    {
        self.factory = factory;
    }
    
    func changePage(webView: WKWebView, page:String) 
    {
        print("change page to : \(page)");
        self.webView = webView;
        switch page {
        case Constants.SERVER_PAGE_NAME:
            controller = self.factory?.createServerController(webView: webView, model: self)
        case Constants.NETWORK_ERROR_PAGE_NAME:
            controller = self.factory?.createNetworkErrorController(webView: webView, model: self)
            break
        default:
                break
        }
        
    }
}
