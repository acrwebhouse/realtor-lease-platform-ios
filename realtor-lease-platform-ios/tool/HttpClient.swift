//
//  HttpClient.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import Alamofire

class HttpClient {
    
    func addNotification(controlModel:Model,notificationToken:String,userId:String,accessToken : String){
        // 定义你要发送的数据，通常是一个字典
        let parameters: [String: Any] = [
            Constants.TOKEN: notificationToken,
            Constants.TYPE: Constants.NOTIFICATION_TYPE_IOS,
            Constants.USER_ID:userId
        ]
        
        let headers: HTTPHeaders = [
            Constants.X_TOKEN: accessToken
        ]
        
        // 定义要发送POST请求的URL
        let url = Constants.ADD_NOTIFICATION_REST_API

        // 发送POST请求
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                // 处理成功的响应
                if let json = value as? [String: Any] {
                    // 解析和使用JSON响应
                    let data = json[Constants.DATA] as? [String: Any]
                    let notificationId : String = data?[Constants._ID] as! String
                    if(notificationId != Constants.EMPTY_STRING){
                        controlModel.saveNotificationIdAndToken(notificationId : notificationId,notificationToken:notificationToken)
                    }
                }
            case .failure(let error):
                // 处理错误
                print("错误：\(error)")
            }
        }
    }
    
    func editNotification(controlModel:Model,notificationId:String,notificationToken:String,userId:String,accessToken : String){
        let parameters: [String: Any] = [
            Constants.ID: notificationId,
            Constants.TOKEN: notificationToken,
            Constants.TYPE: Constants.NOTIFICATION_TYPE_IOS,
            Constants.USER_ID:userId
        ]
        
        let headers: HTTPHeaders = [
            Constants.X_TOKEN: accessToken
        ]
        
        let url = Constants.EDIT_NOTIFICATION_REST_API

        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                // 处理成功的响应
                if let json = value as? [String: Any] {
                    // 解析和使用JSON响应
                    let data = json[Constants.DATA] as? [String: Any]
                    let notificationId : String = data?[Constants._ID] as! String
                    if(notificationId != Constants.EMPTY_STRING){
                        controlModel.saveNotificationIdAndToken(notificationId : notificationId,notificationToken:notificationToken)
                    }
                }
            case .failure(let error):
                // 处理错误
                print("错误：\(error)")
            }
        }
    }
}
