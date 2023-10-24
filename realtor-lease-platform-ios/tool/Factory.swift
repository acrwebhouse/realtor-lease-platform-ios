//
//  Factory.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import WebKit

class Factory {
    func createModel() -> Model{
        return Model()
    }
    
    func createHttpClient() -> HttpClient{
        return HttpClient()
    }
    
    func createController(webView: WKWebView, model: Model) -> Controller{
        return Controller(webView: webView, model: model)
    }
    
    func createServerController(webView: WKWebView, model: Model) -> ServerController{
        return ServerController(webView: webView, model: model)
    }
    
    func createNetworkErrorController(webView: WKWebView, model: Model) -> NetworkErrorController{
        return NetworkErrorController(webView: webView, model: model)
    }
    
    func createConfig() -> Config{
        return Config()
    }
    
    func createConfig(firebaseToken : String ,account : String ,password : String ,notificationId : String ,userId :String ) -> Config{
        return Config(firebaseToken : firebaseToken ,account : account ,password : password ,notificationId : notificationId ,userId :userId )
    }
    
    func createDBConnection() -> DBConnection{
        return DBConnection()
    }
    
}
