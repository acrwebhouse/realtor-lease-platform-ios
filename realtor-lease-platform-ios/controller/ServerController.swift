//
//  ServerController.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import WebKit
class ServerController: Controller{
    override init(webView: WKWebView, model:Model,urlRequest:URLRequest){
            super.init(webView: webView, model: model,urlRequest:urlRequest)
            webView.load(urlRequest)
        }
        
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        
    }
}
