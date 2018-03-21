//
//  Utils.swift
//  Todo
//
//  Created by 万显武 on 2018/3/14.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import Foundation

func dateFromString(_ date:String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: date)
}

func stringFromDate(_ date:Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}
