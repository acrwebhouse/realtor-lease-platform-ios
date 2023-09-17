//
//  JsInterface.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/13.
//

import Foundation

class JsInterface {
    public static let JAVASCRIPT: String = """
            var consoleLog = [];
            const \(Constants.JS_TO_IOS_INTERFACE) = {}
            console.log = function(message) {
                consoleLog.push(message);
                window.webkit.messageHandlers.\(Constants.JS_TO_IOS_INTERFACE).postMessage(message);
            }
            
            function callNative(test) {
                //window.webkit.messageHandlers.\(Constants.JS_TO_IOS_INTERFACE).postMessage("Hello from JavaScript"+test);
                window.webkit.messageHandlers.\(Constants.JS_TO_IOS_INTERFACE).postMessage(getExeFuncMessage("callNative",test));
            }
            
            function loadUrl(url) {
                const args = {
                    url
                }
                window.webkit.messageHandlers.\(Constants.JS_TO_IOS_INTERFACE).postMessage(getExeFuncMessage("loadUrl",args));
            }
            
            function showInternelErrorPageForMobile() {
                window.webkit.messageHandlers.\(Constants.JS_TO_IOS_INTERFACE).postMessage(getExeFuncMessage("showInternelErrorPageForMobile",""));
            }
            
            function backPage() {
                const args = {}
                window.webkit.messageHandlers.\(Constants.JS_TO_IOS_INTERFACE).postMessage(getExeFuncMessage("backPage",args));
            }
            
            function getExeFuncMessage(name,args){
                const result = {
                    name,
                    args
                }
                return JSON.stringify(result)
            
            }
            
            \(Constants.JS_TO_IOS_INTERFACE).callNative = callNative
            \(Constants.JS_TO_IOS_INTERFACE).loadUrl = loadUrl
            \(Constants.JS_TO_IOS_INTERFACE).showInternelErrorPageForMobile = showInternelErrorPageForMobile
            \(Constants.JS_TO_IOS_INTERFACE).backPage = backPage
            
            """
    
    
}
