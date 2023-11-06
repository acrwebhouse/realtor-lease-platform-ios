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
    var httpClient : HttpClient? = nil
    
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
    
    func initHttp(){
        httpClient = self.factory?.createHttpClient()
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
            if(Cache.notificationToken != Constants.EMPTY_STRING){
                config.setAttribute(type: 1, attribute: Cache.notificationToken)
            }
            config.setAttribute(type: 3, attribute: account)
            config.setAttribute(type: 4, attribute: password)
            config.setAttribute(type: 5, attribute: userId)
            dbHelper?.updateConfig(data: config)
        }else{
            let config = factory?.createConfig()
            if(Cache.notificationToken != Constants.EMPTY_STRING){
                config?.setAttribute(type: 1, attribute: Cache.notificationToken)
            }
            config?.setAttribute(type: 3, attribute: account)
            config?.setAttribute(type: 4, attribute: password)
            config?.setAttribute(type: 5, attribute: userId)
            dbHelper?.insertConfig(data: config!)
        }
    }
    
    func saveNotificationInfo(accessToken : String){
        if (dbHelper?.isConfigExist() == true) {
            let config = getConfig()
            let notificationId = config.getNotificationId()
            let notificationToken = Cache.notificationToken
            let userId = config.getUserId()
            if(notificationId == Constants.EMPTY_STRING){
                httpClient?.addNotification(controlModel: self,notificationToken: notificationToken,userId: userId,accessToken : accessToken)
            }else{
                httpClient?.editNotification(controlModel: self,notificationId: notificationId,notificationToken: notificationToken,userId: userId,accessToken : accessToken)
            }
        }
    }
    
    func saveNotificationIdAndToken(notificationId : String,notificationToken : String){
        if (dbHelper?.isConfigExist() == true) {
            let config = getConfig()
            config.setAttribute(type: 1, attribute: notificationToken)
            config.setAttribute(type: 2, attribute: notificationId)
            dbHelper?.updateConfig(data: config)
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
    
    func changeQuickPage(webView: WKWebView, page:String,url:String)
    {
        print("change quick page to : \(page)");
        self.webView = webView;
        switch page {
        case Constants.RESERVE_HOUSE_PAGE_NAME:
            controller = self.factory?.createServerController(webView: webView, model: self,url:url)
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
