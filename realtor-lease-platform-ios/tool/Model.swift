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
    
    func getFileURLRequest(localWebURL:String) -> URLRequest
    {
//        let url = Bundle.main.url(forResource: localWebURL, withExtension: Constants.HTML, subdirectory: Constants.WEB_LOCAL_DIRECTORY)
//        let mainBundle = Bundle.main
//        guard let htmlBundlePath = Bundle.main.path(forResource:"HTMLBundle", ofType:"bundle") else { return <#default value#> }
//        let htmlBundle = Bundle.init(path: htmlBundlePath)
//        let url = htmlBundle.path(forResource:localWebURL, ofType:Constants.HTML, inDirectory:WEB_LOCAL_DIRECTORY)
        let url =  Bundle.main.url(forResource: "GUI/views/networkErrorWeb", withExtension: "html" )
        print("==11=")
        print(url)
        print("==22==")
        let request = NSURLRequest(url: url!)
        return request as URLRequest
    }
    
    func changePage(webView: WKWebView, page:String) 
    {
        print("change page to : \(page)");
        self.webView = webView;
        switch page {
        case Constants.SERVER_PAGE_NAME:
            controller = ServerController(webView: webView, model: self,urlRequest: URLRequest(url: URL(string: Constants.SERVER_URL)!))
//        case Constants.NETWORK_ERROR_PAGE_NAME:
//            controller = NetworkErrorController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.NETWORK_ERROR_URL))
//            let fileURL =  Bundle.main.url(forResource: "GUI/views/networkErrorWeb", withExtension: "html" )
//            let fileURL =  Bundle.main.url(forResource: "networkErrorWeb", withExtension: "html" )
//                    webView.loadFileURL(fileURL!,allowingReadAccessTo:Bundle.main.bundleURL);
//            guard let htmlPath = Bundle.main.path(forResource: "networkErrorWeb", ofType: "html") else { return "" }
//                       let htmlURL = URL(fileURLWithPath: htmlPath)
//                        let request = URLRequest(url: htmlURL)
//                        webView.load(request)
                    
            
        default:
                break
        }
        
    }
}
