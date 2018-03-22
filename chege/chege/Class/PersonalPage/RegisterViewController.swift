//
//  RegisterViewController.swift
//  chege
//
//  Created by 万显武 on 2018/1/29.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var VerbCodeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        VerbCodeBtn.layer.borderColor = kBASE_BLUE_COLOR.cgColor
        VerbCodeBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right:8)//文字与边框边距
        VerbCodeBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
