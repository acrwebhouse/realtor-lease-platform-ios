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
    
    func createServerController(webView: WKWebView, model: Model) -> ServerController{
        return ServerController(webView: webView, model: model)
    }
    
    func createNetworkErrorController(webView: WKWebView, model: Model) -> NetworkErrorController{
        return NetworkErrorController(webView: webView, model: model)
    }
}
