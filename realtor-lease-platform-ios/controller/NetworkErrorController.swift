//
//  NetworkErrorController.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import WebKit

class NetworkErrorController: Controller{
    override init(webView: WKWebView, model:Model){
            super.init(webView: webView, model: model)
            self.loadHtmlFile(fileUrl: Constants.NETWORK_ERROR_URL)
        }
    
    override func executeCmd(name : String, args : [String: Any]){
        print("NetworkErrorController executeCmd name: \(name)")
        print("NetworkErrorController executeCmd args: \(args)")
        switch(name){
        case Constants.RESTART_APP_COMMAND:
            restartApp()
            break;
        default:
            break;
        }
    }
    
    func restartApp(){
        print("=========restartApp========")
    }
    
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        
    }
}
