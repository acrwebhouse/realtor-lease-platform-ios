//
//  HttpClient.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation
import Alamofire

class HttpClient {
    
    func addNotification(){
        // 定义你要发送的数据，通常是一个字典
        let parameters: [String: Any] = [
            "key1": "value1",
            "key2": "value2"
        ]

        // 定义要发送POST请求的URL
        let url = "https://api.example.com/post_endpoint"

        // 发送POST请求
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
            case .success(let value):
                // 处理成功的响应
                if let json = value as? [String: Any] {
                    // 解析和使用JSON响应
                    print("JSON响应：\(json)")
                }
            case .failure(let error):
                // 处理错误
                print("错误：\(error)")
            }
        }
        
        
        
//        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
//        Alamofire.request("https://api.example.com/post", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//            .responseJSON { response in
//                if let data = response.data {
//                    // 處理回應數據
//                }
//            }
    }
}
