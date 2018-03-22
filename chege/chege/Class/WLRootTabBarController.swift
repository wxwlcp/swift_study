//
//  WLRootTabBarController.swift
//  chege
//
//  Created by 万显武 on 2018/1/15.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class WLRootTabBarController: UITabBarController,UINavigationControllerDelegate {
    var FirstVC = ViewController()
    var findCarVC = WLFindCarViewController();
    var ShopMal = WLShopMalViewController()
    var MyVC = WLMyPageViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CustomTabBaritem()
        AddChilds(VC: FirstVC, title: "首页", normalImage:"tabbar_home_normal", selectedImage: "tabbar_home_selected")
        AddChilds(VC: findCarVC, title: "寻车", normalImage: "tabbar_findcar_normal", selectedImage: "tabbar_findcar_selected")
        AddChilds(VC: ShopMal, title: "商城", normalImage:"tabbar_mall_normal", selectedImage:"tabbar_mall_selected")
        AddChilds(VC: MyVC, title: "我的", normalImage:"tabbar_mine_normal", selectedImage: "tabbar_mine_selected")
        // Do any additional setup after loading the view.
    }
    
    func AddChilds(VC:UIViewController!,title:String!,normalImage:String!,selectedImage:String!) -> Void {
        
        let BaseNavi = WLBaseNavigationController(rootViewController:VC)
        VC.title = title
        VC.navigationItem.leftBarButtonItem = nil
        VC.view.backgroundColor = UIColor.white
        BaseNavi.tabBarItem = UITabBarItem(title:title,image:UIImage(named:normalImage),selectedImage:UIImage(named:selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        BaseNavi.delegate = self
        addChildViewController(BaseNavi);
        
    }
    
    
    func CustomTabBaritem(){
        self.tabBar.isTranslucent = true
        
        self.tabBar.backgroundColor = UIColor.white
        
        UITabBarItem.appearance() .setTitleTextAttributes([NSAttributedStringKey.foregroundColor:kBASE_BlACK_COLOR,
                                                          NSAttributedStringKey.font:UIFont.systemFont(ofSize: 10)],for: UIControlState.normal)
        UITabBarItem.appearance() .setTitleTextAttributes([NSAttributedStringKey.foregroundColor:kBASE_BLUE_COLOR,
                                                          NSAttributedStringKey.font:UIFont.systemFont(ofSize: 10)],for: UIControlState.selected)
        UIBarButtonItem.appearance() .setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for: UIBarMetrics.default)

    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController.hidesBottomBarWhenPushed {
            self.tabBar.isHidden = true
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
