//
//  toDoItem.swift
//  Todo
//
//  Created by 万显武 on 2018/3/14.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import Foundation

class TodoItem:NSObject {
    var id : String
    var image: String
    var title: String
    var date: Date
    
    init(id:String,image:String,title:String,date:Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
