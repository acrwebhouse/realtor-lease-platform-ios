//
//  DBConnection.swift
//  realtor-lease-platform-ios
//
//  Created by 蔣政言 on 2023/10/22.
//

import Foundation
import SQLite

class DBConnection {
     init(){
        print("DBConnection init")
         if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
             let dbPath = documentDirectory.appendingPathComponent(Constants.DATABASE_NAME)
             // 使用 'dbPath' 作為數據庫路徑
             print("====dbPath==\(dbPath)======")
             do {
                 //let db = try Connection(dbPath)
                 // 在這裡你可以使用 'db' 來執行數據庫操作
             } catch {
                 print(error)
             }
         }
    }
}
