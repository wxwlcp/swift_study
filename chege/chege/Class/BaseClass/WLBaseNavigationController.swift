//
//  WLBaseNavigationController.swift
//  chege
//
//  Created by 万显武 on 2018/1/15.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class WLBaseNavigationController: UINavigationController ,UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = true
        
        
        let navigationBar:UINavigationBar = self.navigationBar;
        
        
        //设置bar的整体背景颜色
        navigationBar.barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        //设置title的属性
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font :UIFont(name: "Heiti SC", size: 18.0)!]
        //设置uibarbutton的颜色
        navigationBar.tintColor =  UIColor.black
        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"back"), style: UIBarButtonItemStyle.plain, target:self,action:#selector(back))
        //这句会立即调用被push的VC的viewDidLoad方法，必须放在最后面，否则上面的代码会对viewDidLoad中代码造成覆盖，导致viewDidLoad设置无效。
        super.pushViewController(viewController, animated: true);//animated换为NO，所有VC没有动画
    }
    
    @objc func back(){
        self.popViewController(animated: true)
        print(#function)
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
