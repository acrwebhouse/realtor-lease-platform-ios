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
     init(){
        print("DBConnection init")
         if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
             let dbPath = documentDirectory.appendingPathComponent(Constants.DATABASE_NAME)
             // 使用 'dbPath' 作為數據庫路徑
             print("====dbPath==\(dbPath)======")
             do {
                 db = try Connection("\(dbPath)")
//                 db = try Connection("path_to_your_database.db")
                 // 在這裡你可以使用 'db' 來執行數據庫操作
             } catch {
                 print(error)
             }
         }
    }
    
    func createTable(){
        let config = Table(Constants.TABLE_CONFIG_SQL)
        let id = Expression<Int>(Constants.ID_SQL)
        let firebaseToken = Expression<String>(Constants.CONFIG_FIREBASE_TOKEN_SQL)
        let notificationId = Expression<String>(Constants.CONFIG_NOTIFICATION_ID_SQL)
        let account = Expression<String>(Constants.CONFIG_ACCOUNT_SQL)
        let password = Expression<String>(Constants.CONFIG_PASSWORD_SQL)
        let userId = Expression<String>(Constants.CONFIG_USER_ID_SQL)
        do {
            try db?.run(config.create { table in
                table.column(id, primaryKey: true)
                table.column(firebaseToken)
                table.column(notificationId)
                table.column(account)
                table.column(password)
                table.column(userId)
            })
        } catch {
            print(error)
        }
    }
    
    func listTable(){
//        let config = Table(Constants.TABLE_CONFIG_SQL)
//        let id = Expression<Int>(Constants.ID_SQL)
//        let firebaseToken = Expression<String>(Constants.CONFIG_FIREBASE_TOKEN_SQL)
//        let notificationId = Expression<String>(Constants.CONFIG_NOTIFICATION_ID_SQL)
//        let account = Expression<String>(Constants.CONFIG_ACCOUNT_SQL)
//        let password = Expression<String>(Constants.CONFIG_PASSWORD_SQL)
//        let userId = Expression<String>(Constants.CONFIG_USER_ID_SQL)
//        do {
//            for item in try db?.prepare(config) {
//                print("config id: \(item[id]), account: \(item[account]), password: \(item[password])")
//            }
//        } catch {
//            print(error)
//        }
    }
    
}
