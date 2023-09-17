//
//  Controller.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import WebKit

class Controller {
    
    var webView: WKWebView?
    var controlModel: Model
    
    
    init(webView: WKWebView, model: Model){
           self.webView = webView
           self.controlModel = model
       }
    
    func loadUrl(url : String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        self.webView?.load(urlRequest)
    }
    
    func loadHtmlFile(fileUrl : String){
            if let localFilePath = Bundle.main.url(forResource: fileUrl, withExtension: Constants.HTML , subdirectory: Constants.WEB_LOCAL_DIRECTORY) {
                self.webView?.loadFileURL(localFilePath, allowingReadAccessTo: localFilePath)
            }else {
                // Handle the case where the HTML file is not found
                print("HTML file not found")
            }
        }
    
    func executeCmd(name : String, args : [String: Any]){
        print("executeCmd name: \(name)")
        print("executeCmd args: \(args)")
    }
    
    func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        print("------parent controller------")
    }
    
}
