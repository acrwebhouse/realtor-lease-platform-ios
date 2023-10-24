//
//  Config.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/10/24.
//

import Foundation

public class Config {
    
    var id : Int  = 0;
    var firebaseToken : String = Constants.EMPTY_STRING ;
    var account : String = Constants.EMPTY_STRING ;
    var password : String = Constants.EMPTY_STRING ;
    var notificationId : String = Constants.EMPTY_STRING ;
    var userId : String = Constants.EMPTY_STRING ;
    
    init(){
    }
    
    init(firebaseToken : String ,account : String ,password : String ,notificationId : String ,userId :String ){
        self.firebaseToken = firebaseToken;
        self.account = account;
        self.password = password;
        self.notificationId = notificationId;
        self.userId = userId;
    }
    
    func setAttribute( type :Int, attribute : String) {
        switch (type) {
        case 0:
            self.id = Int(attribute) ?? 0;
            break;
        case 1:
            self.firebaseToken = attribute;
            break;
        case 2:
            self.notificationId = attribute;
            break;
        case 3:
            self.account = attribute;
            break;
        case 4:
            self.password = attribute;
            break;
        case 5:
            self.userId = attribute;
            break;
            
        default:
            print("no attribute")
        }
    }
    
    func getId() -> Int {
        return id
    }
    
    func getAccount() -> String {
        return account
    }
    
    func getPassword() -> String {
        return password
    }
    
    func getFirebaseToken() -> String {
        return firebaseToken
    }
    
    func getNotificationId() -> String {
        return notificationId
    }
    
    func getUserId() -> String {
        return userId
    }
}
