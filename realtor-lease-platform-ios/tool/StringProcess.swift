//
//  StringProcess.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation

class StringProcess {
    
    static func getEvaluateJavaScriptString(funcName:String, jsonString:String) -> String{
        return Constants.JAVASCRIPT_PARAMETER_FOR_IOS+".\(funcName)('\(jsonString)')"
    }
}
