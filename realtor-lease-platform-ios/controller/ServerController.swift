//
//  ServerController.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import WebKit
class ServerController: Controller{
    override init(webView: WKWebView, model:Model){
            super.init(webView: webView, model: model)
            self.loadUrl(url: Constants.SERVER_URL)
        }
        
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        
    }
    
    override func executeCmd(name : String, args : [String: Any]){
        print("ServerController executeCmd name: \(name)")
        print("ServerController executeCmd args: \(args)")
        switch(name){
            case Constants.LOAD_URL_COMMAND:
            let url = args[Constants.URL]
            let serverUrl = StringProcess.getServerUrl(localUrl: url as! String)
            self.loadUrl(url: serverUrl)
            break;
        case Constants.BACK_PAGE_COMMAND:
            self.backPage()
            break;
        default:
            break;
        }
    }
    
}
