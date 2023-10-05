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
        case Constants.SHOW_INTERNEL_ERROR_PAGE_COMMAND:
            showInternelErrorPage()
            break;
        case Constants.CALL_UP_COMMAND:
            let phoneNumber = args[Constants.PHONE_NUMBER] as! String
            callUp(phoneNumber: phoneNumber)
            break;
        case Constants.ADD_LIN_FRIEND_COMMAND: //不 work
            let lineId = args[Constants.LINE_ID] as! String
            addLineFriend(lineId : lineId)
            break;
        default:
            break;
        }
    }
    
    func callUp(phoneNumber : String){
        if let phoneURL = URL(string: StringProcess.getCallUpPhoneNumber(phoneNumber: phoneNumber)) {
            if UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
            } else {
                print("無法打電話 \(phoneNumber)")
            }
        }
    }
    
    func addLineFriend(lineId : String) {
        let lineURL = URL(string: StringProcess.getAddLineFriendLineId(lineId: lineId))!
        if UIApplication.shared.canOpenURL(lineURL) {
            UIApplication.shared.open(lineURL, options: [:], completionHandler: nil)
        } else {
           // 若沒安裝 Line 則導到 App Store(id443904275 為 Line App 的 ID)
            let lineURL = URL(string: Constants.LINE_APP_STORE_ADDRESS)!
            UIApplication.shared.open(lineURL, options: [:], completionHandler: nil)
        }
       
    }
    
}
