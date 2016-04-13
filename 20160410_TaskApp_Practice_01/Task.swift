//
//  Task.swift
//  20160410_TaskApp_Practice_01
//
//  Created by tlsmooth89 on 4/11/16.
//  Copyright © 2016 yusuke.iwasaki. All rights reserved.
//

import RealmSwift

class Task: Object {
    dynamic var id = 0
    dynamic var title = ""
    dynamic var contents = ""
    dynamic var date = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
