//
//  Constannts.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/9/4.
//

import Foundation

class Constants {
    public static let SERVER_URL: String = "https://matchrentdev.com";
//    public static let SERVER_URL: String = "http://localhost:3000";
    

    
    //javascript
    public static let JS_TO_IOS_INTERFACE: String = "jsToIosInterface";
    public static let IOS_TO_JS_INTERFACE: String = "iosToJsInterface";
    public static let SERVER_PAGE_NAME: String = "serverPage";
    public static let NETWORK_ERROR_PAGE_NAME: String = "networkErrorPage";
    public static let NETWORK_ERROR_URL: String = "networkErrorWeb";
    
    //commandName
    public static let LOAD_URL_COMMAND: String  = "loadUrl";
    public static let BACK_PAGE_COMMAND: String  = "backPage"
    public static let SHOW_INTERNEL_ERROR_PAGE_COMMAND: String  = "showInternelErrorPage"
    public static let RESTART_APP_COMMAND: String  = "restartApp"
    public static let CALL_UP_COMMAND: String  = "callUp"
    public static let ADD_LIN_FRIEND_COMMAND: String  = "addLineFriend"
    public static let SET_ACCOUNT_PASSWORD_COMMAND: String  = "setAccountPassword"
    public static let SAVE_USER_INFO_COMMAND: String  = "saveUserInfo"
    public static let SAVE_NOTIFICATION_INFO_COMMAND: String  = "saveNotificationInfo"
    
    //db
    public static let DATABASE_NAME: String  = "ACRDB.db";
    public static let ID_SQL : String = "id";
    public static let TABLE_CONFIG_SQL : String = "Config";
    public static let CONFIG_NOTIFICATION_TOKEN_SQL : String = "notificationToken";
    public static let CONFIG_NOTIFICATION_ID_SQL : String = "notificationId";
    public static let CONFIG_ACCOUNT_SQL : String = "account";
    public static let CONFIG_PASSWORD_SQL : String = "password";
    public static let CONFIG_USER_ID_SQL : String = "userId";
    
    //util
    public static let WEB_LOCAL_DIRECTORY: String = "GUI/views";
    public static let HTML: String  = "html";
    public static let NAME: String  = "name";
    public static let ARGS: String  = "args";
    public static let URL: String  = "url";
    public static let MAIN: String  = "Main";
    public static let PHONE_NUMBER: String  = "phoneNumber";
    public static let LINE_ID: String  = "lineId";
    public static let LINE_APP_STORE_ADDRESS: String  = "itms-apps://itunes.apple.com/app/id443904275"
    public static let EMPTY_STRING : String  = "";
    public static let PASSWORD: String  = "password";
    public static let ACCOUNT_OR_MAIL: String  = "accountOrMail";
    public static let USER_ID: String  = "userId";
    public static let ID: String  = "id";
    public static let NOTIFICATION_TOKEN: String  = "notificationToken";
    public static let TOKEN: String  = "token";
    public static let TYPE: String  = "type";
    public static let NOTIFICATION_TYPE: Int  = 2;
    public static let ACCESS_TOKEN: String  = "accessToken";
    public static let X_TOKEN: String  = "x-token";
    public static let DATA: String  = "data";
    public static let _ID: String  = "_id";
    
    //rest api
    public static let ADD_NOTIFICATION_REST_API: String = SERVER_URL + "/user-service/notification/addNotification";
    public static let EDIT_NOTIFICATION_REST_API: String = SERVER_URL + "/user-service/notification/editNotification";
    
}
