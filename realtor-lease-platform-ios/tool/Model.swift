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
    var dbHelper : DBConnection? = nil
    
    func setViewController(ViewController:UIViewController)
    {
        viewController = ViewController;
    }
    
    func setFactory(factory:Factory)
    {
        self.factory = factory;
    }
   
    func getController()-> Controller{
        return self.controller!
    }
    
    func connectDB(){
        dbHelper = self.factory?.createDBConnection()
    }
    
    func getConfig() -> Config{
        var result = factory?.createConfig()
        if (dbHelper?.isConfigExist() == true) {
            result = dbHelper?.getConfig()
        }
        return result ?? Config();
    }
    
    func saveUserInfo(account : String , password : String , userId : String ){
        if (dbHelper?.isConfigExist() == true) {
            let config = getConfig()
            config.setAttribute(type: 3, attribute: account)
            config.setAttribute(type: 4, attribute: password)
            config.setAttribute(type: 5, attribute: userId)
            dbHelper?.updateConfig(data: config)
        }else{
            let config = factory?.createConfig()
            config?.setAttribute(type: 3, attribute: account)
            config?.setAttribute(type: 4, attribute: password)
            config?.setAttribute(type: 5, attribute: userId)
            dbHelper?.insertConfig(data: config!)
        }
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
    
    func setDefaultAccountPassword(account : String,password : String)
    {
        let setDefaultAccountPasswordJsFunc = StringProcess.getSetDefaultAccountPasswordJsFunc(account: account,password: password)
        webView?.evaluateJavaScript(setDefaultAccountPasswordJsFunc)
    }
}
