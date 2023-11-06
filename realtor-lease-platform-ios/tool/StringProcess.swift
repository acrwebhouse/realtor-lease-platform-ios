//
//  StringProcess.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation

class StringProcess {
    
    static func getEvaluateJavaScriptString(funcName:String, jsonString:String) -> String{
        return Constants.JS_TO_IOS_INTERFACE+".\(funcName)('\(jsonString)')"
    }
    
    static func convertToDictionary(text: String) -> [String: Any]? {
        if(text == ""){
            return [:]
        }
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
//                print("err : "+text)
//                print(error.localizedDescription)
            }
        }
        return [:]
    }
    
    static func getServerUrl(localUrl: String) -> String {
        return Constants.SERVER_URL + localUrl
    }
    
    static func getCallUpPhoneNumber(phoneNumber: String) -> String {
        return "tel://\(phoneNumber)"
    }
    
    static func getAddLineFriendLineId(lineId: String) -> String {
        return "line://ti/p/~\(lineId)"
    }
    
    static func getSetDefaultAccountPasswordJsFunc(account: String,password: String) -> String {
        return "setDefaultAccountPassword(\"\(account)\",\"\(password)\")"
    }
    
    static func getReserveHouseUrl(reserveHouseId:String) -> String {
        return Constants.SERVER_URL + "/21/" + reserveHouseId;
    }
}
