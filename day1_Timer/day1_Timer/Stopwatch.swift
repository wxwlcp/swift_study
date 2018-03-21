//
//  File.swift
//  day1_Timer
//
//  Created by 万显武 on 2018/3/12.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import Foundation

class Stopwatch: NSObject {
    var counter = Double()
    var timer = Timer()
    
    
    override init() {
        counter = 0.0
        timer = Timer()
        
    }
}
