//
//  ViewController.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2022/6/6.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKScriptMessageHandler  {
    let url = Constants.SERVER_URL
    var factory : Factory? = nil
    var webView: WKWebView? = nil
    var controlModel: Model? = nil
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == Constants.JS_TO_IOS_INTERFACE, let jsMessage = message.body as? String {
                    print("JavaScript message: \(jsMessage)")
            do {
                
                let commandDic = StringProcess.convertToDictionary(text: jsMessage)
                if commandDic?.count ?? 0 > 0 {
                    let name = commandDic?[Constants.NAME] as! String
                    let args = commandDic?[Constants.ARGS] as! [String : Any]
                    let controller = controlModel?.getController()
                    controller?.executeCmd(name: name, args:args)
                }
            } catch {
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObject()
        initGUI()
        // Do any additional setup after loading the view.
    }
    
    func initObject() {
        factory = Factory()
        controlModel = factory?.createModel()
        controlModel?.setFactory(factory: factory!)
        controlModel?.setViewController(ViewController: self)
    }
    
    func initGUI() {
        
        let userScript = WKUserScript(source: JsInterface.JAVASCRIPT, injectionTime: .atDocumentStart, forMainFrameOnly: false)

        let contentController = WKUserContentController();
        contentController.addUserScript(userScript)
        contentController.add(self , name: Constants.JS_TO_IOS_INTERFACE)
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.websiteDataStore = WKWebsiteDataStore.default()
        self.webView = WKWebView(
                    frame: CGRect(x:0, y:20, width: self.view.frame.width, height:self.view.frame.height-20),
                    configuration: config
                )
        self.view.addSubview(self.webView!)
//        controlModel?.changePage(webView: webView ?? WKWebView(), page: Constants.NETWORK_ERROR_PAGE_NAME)
        controlModel?.changePage(webView: webView ?? WKWebView(), page: Constants.SERVER_PAGE_NAME)
        
    }

}

