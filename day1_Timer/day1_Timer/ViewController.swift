//
//  ViewController.swift
//  day1_Timer
//
//  Created by 万显武 on 2018/3/12.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    
    fileprivate let mainStopwatch: Stopwatch = Stopwatch()
    fileprivate let lapStopwatch: Stopwatch = Stopwatch()
    fileprivate var isPlay:Bool = false
    fileprivate var laps:[String] = []
    
    @IBOutlet weak var lapsTimelabal: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var StartBtn: UIButton!
    @IBOutlet weak var LapBtn: UIButton!
    @IBOutlet weak var lapTableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "计时器"
//        let initCircleButton:(UIButton) -> Void = { button in
//            button.layer.cornerRadius = 0.5 * button.frame.size.width
//            button.backgroundColor = UIColor.white
//        }
        
        func initCircleButton(_ button:UIButton){
            button.layer.cornerRadius = 0.5 * button.frame.size.width
            button.backgroundColor = UIColor.white
        }
        initCircleButton(StartBtn)
        initCircleButton(LapBtn)
        
        LapBtn.isEnabled = false
        
        lapTableview.delegate = self
        lapTableview.dataSource = self
        
        lapTableview.tableFooterView = UIView()//隐藏没有cell时的线条
    }
    
    
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.default
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartAction(_ sender: Any) {
        LapBtn.isEnabled = true
        ChangeButton(LapBtn, title: "Lap", titleColor: UIColor.black)
        if !isPlay {
            unowned let weakself = self
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.01, target: weakself, selector: Selector.updateMainTimer, userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.01, target: weakself, selector: Selector.updatelapTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(mainStopwatch.timer, forMode: RunLoopMode.commonModes)
            RunLoop.current.add(lapStopwatch.timer, forMode: RunLoopMode.commonModes)
            isPlay = true
            ChangeButton(StartBtn, title: "Stop", titleColor: UIColor.red)
        }else{
            isPlay = false
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            ChangeButton(LapBtn, title: "reset", titleColor: UIColor.black)
            ChangeButton(StartBtn, title: "start", titleColor: UIColor.green)
            
        }
 
    }
    @IBAction func lapAction(_ sender: Any) {
        if !isPlay {
            resetMainTimer()
            resetLapTimer()
            ChangeButton(LapBtn, title: "Lap", titleColor: UIColor.black)
            
            LapBtn.isEnabled = false
        }else{
            if let timerLabelText = timeLabel.text {
                laps.append(timerLabelText)
            }
            lapTableview.reloadData()
            resetLapTimer()
            unowned let weakSelf = self
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.01, target: weakSelf, selector: Selector.updatelapTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
        }
    }
    fileprivate func ChangeButton(_ button:UIButton,title:String,titleColor:UIColor){
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        
    }
    
    fileprivate func resetMainTimer(){
        resetTimer(mainStopwatch, label: timeLabel)
        laps.removeAll()
        lapTableview.reloadData()
    }
    fileprivate func resetLapTimer(){
        resetTimer(lapStopwatch, label: lapsTimelabal)
    }
    fileprivate func resetTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }
    
    @objc func updateMainTimer(){
        updateTimer(mainStopwatch, label: timeLabel)
    }
    @objc func updatelapTimer(){
        
        updateTimer(lapStopwatch, label: lapsTimelabal)
    }
    
    func updateTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.counter = stopwatch.counter + 0.01
        var minutes: String = "\((Int)(stopwatch.counter / 60))"
        if (Int)(stopwatch.counter / 60) < 10 {
            minutes = "0\((Int)(stopwatch.counter / 60))"
        }
        var seconds: String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let lapNumlabel = cell.viewWithTag(11) as? UILabel {
            lapNumlabel.text = "Lap \(laps.count - indexPath.row)"
        }
        if let timeLabel = cell.viewWithTag(12) as? UILabel{
            timeLabel.text = laps[laps.count - indexPath.row - 1]
        }
        
        return cell
    }
}

fileprivate extension Selector{
    static let updateMainTimer = #selector(ViewController.updateMainTimer)
    static let updatelapTimer = #selector(ViewController.updatelapTimer)
}

