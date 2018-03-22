//
//  SecondViewController.swift
//  Closure
//
//  Created by 万显武 on 2018/3/22.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

typealias InputClosureType = (String) -> Void //定义闭包类型（特定的函数类型）

class SecondViewController: UIViewController {

    @IBOutlet weak var A: UITextField!
    
    var backClosure:InputClosureType? //接受上个页面传过来的闭包块
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setBackMyClosure(tempClosure:@escaping InputClosureType) {
        self.backClosure = tempClosure
    }
    

    @IBAction func back(_ sender: Any) {
        if self.backClosure != nil {
            let temptext:String? = self.A.text
            if temptext != nil{
                self.backClosure!(temptext!)
            }
            
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
