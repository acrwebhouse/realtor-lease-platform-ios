//
//  DBConnection.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/10/22.
//

import Foundation
import SQLite

class DBConnection {
    var db : Connection? = nil
    let config = Table(Constants.TABLE_CONFIG_SQL)
    let factory = Factory()
     init(){
        print("DBConnection init")
         if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
             let dbPath = documentDirectory.appendingPathComponent(Constants.DATABASE_NAME)
             // 使用 'dbPath' 作為數據庫路徑
             do {
                 
                 db = try Connection("\(dbPath)")
                 createTable()
                 //insert()
             } catch {
                 print(error)
             }
         }
    }
    
    func createTable(){
        let id = Expression<Int>(Constants.ID_SQL)
        let notificationToken = Expression<String>(Constants.CONFIG_NOTIFICATION_TOKEN_SQL)
        let notificationId = Expression<String>(Constants.CONFIG_NOTIFICATION_ID_SQL)
        let account = Expression<String>(Constants.CONFIG_ACCOUNT_SQL)
        let password = Expression<String>(Constants.CONFIG_PASSWORD_SQL)
        let userId = Expression<String>(Constants.CONFIG_USER_ID_SQL)
        do {
            try db?.run(config.create { table in
                table.column(id, primaryKey: true)
                table.column(notificationToken)
                table.column(notificationId)
                table.column(account)
                table.column(password)
                table.column(userId)
            })
        } catch {
            print(error)
        }
    }
    
    func insert(){
        let notificationToken = Expression<String>(Constants.CONFIG_NOTIFICATION_TOKEN_SQL)
        let notificationId = Expression<String>(Constants.CONFIG_NOTIFICATION_ID_SQL)
        let account = Expression<String>(Constants.CONFIG_ACCOUNT_SQL)
        let password = Expression<String>(Constants.CONFIG_PASSWORD_SQL)
        let userId = Expression<String>(Constants.CONFIG_USER_ID_SQL)
        do {
            try db?.run(config.insert(
//                firebaseToken <- Constants.EMPTY_STRING ,
//                notificationId <- Constants.EMPTY_STRING ,
//                account <- Constants.EMPTY_STRING ,
//                password <- Constants.EMPTY_STRING ,
//                userId <- Constants.EMPTY_STRING
                notificationToken <- "notificationToken" ,
                notificationId <- "notificationId" ,
                account <- "123" ,
                password <- "456" ,
                userId <- "789"
            ))
        }
        catch {
            print(error)
        }
        
    }
    
    func insertConfig(data:Config) {
        let notificationToken = Expression<String>(Constants.CONFIG_NOTIFICATION_TOKEN_SQL)
        let notificationId = Expression<String>(Constants.CONFIG_NOTIFICATION_ID_SQL)
        let account = Expression<String>(Constants.CONFIG_ACCOUNT_SQL)
        let password = Expression<String>(Constants.CONFIG_PASSWORD_SQL)
        let userId = Expression<String>(Constants.CONFIG_USER_ID_SQL)
        do {
            try db?.run(config.insert(
                notificationToken <- "\(data.getNotificationToken())" ,
                notificationId <- "\(data.getNotificationId())" ,
                account <- "\(data.getAccount())" ,
                password <- "\(data.getPassword())" ,
                userId <- "\(data.getUserId())"
            ))
        }
        catch {
            print(error)
        }
    }
    
    func updateConfig(data:Config) {
        let id = Expression<Int>(Constants.ID_SQL)
        let notificationToken = Expression<String>(Constants.CONFIG_NOTIFICATION_TOKEN_SQL)
        let notificationId = Expression<String>(Constants.CONFIG_NOTIFICATION_ID_SQL)
        let account = Expression<String>(Constants.CONFIG_ACCOUNT_SQL)
        let password = Expression<String>(Constants.CONFIG_PASSWORD_SQL)
        let userId = Expression<String>(Constants.CONFIG_USER_ID_SQL)
        do {
            try db?.run(config.update(
                id <- data.getId() ,
                notificationToken <- "\(data.getNotificationToken())" ,
                notificationId <- "\(data.getNotificationId())" ,
                account <- "\(data.getAccount())" ,
                password <- "\(data.getPassword())" ,
                userId <- "\(data.getUserId())"
            ))
        }
        catch {
            print(error)
        }
    }
    
    func getConfig() -> Config {
        let id = Expression<Int>(Constants.ID_SQL)
        let notificationToken = Expression<String>(Constants.CONFIG_NOTIFICATION_TOKEN_SQL)
        let notificationId = Expression<String>(Constants.CONFIG_NOTIFICATION_ID_SQL)
        let account = Expression<String>(Constants.CONFIG_ACCOUNT_SQL)
        let password = Expression<String>(Constants.CONFIG_PASSWORD_SQL)
        let userId = Expression<String>(Constants.CONFIG_USER_ID_SQL)
        var result = factory.createConfig()
        do {
            for row in try db!.prepare(config) {
                //print("id: \(row[id]), firebaseToken: \(row[firebaseToken]), notificationId: \(row[notificationId]), account: \(row[account]), password: \(row[password]), userId: \(row[userId])")
                let rowId = Int(row[id])
                if(rowId == 0){
                    result = factory.createConfig(notificationToken : row[notificationToken] ,account : row[account] ,password : row[password] ,notificationId : row[notificationId] ,userId :row[userId])
                    break
                }
            }
        } catch {
            print (error)
        }
        return result
    }
    
    func isConfigExist() ->Bool {
        var result = false
        do{
            let configCount = try db!.scalar(config.count)
            if(configCount > 0){
                result = true
            }
        }catch {
            print (error)
        }
        return result
    }
    
}
