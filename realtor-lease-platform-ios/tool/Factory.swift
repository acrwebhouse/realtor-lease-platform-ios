//
//  Factory.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation

class Factory {
    func createModel() -> Model{
        return Model()
    }
    
    func createHttpClient() -> HttpClient{
        return HttpClient()
    }
}
