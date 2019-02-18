//
//  ViewController.swift
//  StopWatch
//
//  Created by 万显武 on 2019/2/18.
//  Copyright © 2019 万显武. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Timelabel: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    
    //浮点数默认d是double类型，如要使用float，需要显示声明
    //var counter:Float = 0.0
    var counter: Float = 0.0 {
        //属性观察器 属性观察 (Property Observers) 是 Swift 中一个很特殊的特性 详情可见https://swifter.tips/property-observer/ 王巍 撰写
        willSet{
            print("counter 的初始值\(counter) 新值 \(newValue)")
        }
        //在这里面可以对新的值做限制 比如不想这个值大于100.0
        didSet{
            print("旧值 \(oldValue) ")
            Timelabel.text = String(format: "%.1f", counter)
        }
    }
    
    
    //给予timer一个默认值，这样timer就不会为optional
    //后续可以不用解包
    //var timer: Timer? = Timer()
    
    //这样定义可以不用再timer时 回收内存
    var timer:Timer? = Timer()
    var isPlaying = false
    
    //知识点：存储属性和计算属性 详情可见https://swifter.tips/property-observer/ 王巍 撰写
//    class A {
//        var number :Int {
//            get {
//                print("get")
//                return 1
//            }
//
//            set {print("set")}
//        }
//    }
//
//    class B: A {
//        override var number: Int {
//            willSet {print("willSet")}
//            didSet {print("didSet")}
//        }
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        //只读计算属性，可以去掉get 和花括号
//        get {
//            return UIStatusBarStyle.lightContent
//        }
        return UIStatusBarStyle.default
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 符合LosslessStringConvertible协议的，
        // 都可以直接初始化一个String对象
        // timeLabel.text = String(counter)
    
        // 改成使用属性观察器监控和响应属性值的变化
        counter = 0.0
    }
    
    
    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
        
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
        
    }
    
    
    
    @IBAction func playButtonDidTouch(_ sender: UIButton) {
        
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        // 调用实例的方法时建议用self.UpdateTimer,
        // 不建议使用ViewController.UpdateTimer
        // 因为若方法定义成了类方法，第二种方式编译器不会报错。
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
        
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        
        if let timerTemp = timer {
            timerTemp.invalidate()  //停止计算
        }
        timer = nil
        isPlaying = false
        
    }
    
    
    @objc func UpdateTimer(){
        counter = counter + 0.1
    }
}

