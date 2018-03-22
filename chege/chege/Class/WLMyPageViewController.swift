//
//  WLMyPageViewController.swift
//  chege
//
//  Created by 万显武 on 2018/1/15.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class WLMyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let quitBtn = UIButton(type: UIButtonType.system)
        quitBtn.setTitle("退出登录", for: UIControlState.normal)
        quitBtn.addTarget(self, action: #selector(quitLogin), for: .touchUpInside)
        quitBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 50)
        
        self.view.addSubview(quitBtn)
        // Do any additional setup after loading the view.
    }
    
    @objc func quitLogin () {
        let UserLoginVC = UserLoginViewController()
        self.present(UserLoginVC, animated: true) {
            UserDefaults.standard.removeObject(forKey: "userLoginId")
            UserDefaults.standard.removeObject(forKey: "partyId")
            UserDefaults.standard.removeObject(forKey: "jwt_token")
        }
        
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
