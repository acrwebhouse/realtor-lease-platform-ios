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
    var urlRequest: URLRequest
    
    init(webView: WKWebView, model: Model, urlRequest: URLRequest){
           self.webView = webView
           self.controlModel = model
           self.urlRequest = urlRequest
//           controlModel.showLoadingView(show: false)
       }
    
    func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        print("------parent controller------")
    }
    
}
