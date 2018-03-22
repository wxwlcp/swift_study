//
//  UserLoginViewController.swift
//  chege
//
//  Created by 万显武 on 2018/1/15.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UserLoginViewController: UIViewController ,UINavigationControllerDelegate{

    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var userLoginId: UserNameTextField!
    @IBOutlet weak var PwdTF: UserNameTextField!
    @IBOutlet weak var AgreeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTextField(textfield: userLoginId)
        self.setTextField(textfield: PwdTF)
        AgreeBtn.layer.borderWidth = 1.5
        AgreeBtn.layer.borderColor = kBASE_BLUE_COLOR.cgColor
        self.navigationController?.delegate = self;
//        AgreeBtn.isSelected = true
        // Do any additional setup after loading the view.
    }
    
    
    func setTextField(textfield:UserNameTextField) -> Void {
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.5
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.leftViewMode=UITextFieldViewMode.always;
        textfield.layer.shadowOffset = CGSize(width: 0, height: 50)
        textfield.layer.shadowRadius = 20;
        textfield.layer.shadowColor = UIColor.red.cgColor;
        textfield.layer.shadowOpacity = 0.5;
        if userLoginId == textfield {
            textfield.leftView = UIImageView(image: UIImage(named: "登录"))
        }else{
            textfield.leftView = UIImageView(image: UIImage(named: "密码"))
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: -- 登录操作
    @IBAction func LoginAction(_ sender: UIButton) {
        let LoginId:String? = userLoginId.text
        if LoginId == nil {
            return;
        }
        let pwd:String? = PwdTF.text
        if pwd == nil {
            return;
        }
        let device_type = "iOS-Customer"
        let param = ["username":LoginId!,"password":pwd!,"deviceType":device_type]
        let url = "http://platform.chege.cn/mall/login/frontLogin"

        Alamofire.request(url, method: .post, parameters: param ,encoding:URLEncoding.default).responseJSON{ (response) in
            print(response.data as Any) //server data
            if let dic = response.result.value{
                print("dic: \(dic)")
                let Json = JSON(dic)
                print("dic: \(Json["responseMessage"])")
                if Json["code"].intValue == 2000{
                   self.LoginSuccess(Json["userLoginId"].stringValue, partyId: Json["partyId"].stringValue, jwt_token: Json["jwt_token"].stringValue)
                }else{
                    print("dic: \(Json["errorMessage"])")
                }
            }
            else
            {
                print("dic: \(response)")
            }
        }
        /*
         result==SUCCESS
         code: Optional(0)
         */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //登录成功
    func LoginSuccess(_ userLoginId:String,partyId:String,jwt_token:String) -> Void {
        
        let wlroot = WLRootTabBarController()
        
        self.present(wlroot, animated: true) {
            //设置存储信息
            UserDefaults.standard.set(userLoginId, forKey: "userLoginId")
            UserDefaults.standard.set(partyId, forKey: "partyId")
            UserDefaults.standard.set(jwt_token, forKey: "jwt_token")
            UserDefaults.standard.synchronize()
        }
    }
    
    //注册
   
    @IBAction func RegiserAction(_ sender: UIButton) {
        let registerVc = RegisterViewController()
        registerVc.title = "注册"
        self.navigationController?.pushViewController(registerVc, animated: true)
    }
    //忘记密码
    @IBAction func ForgetPwdAction(_ sender: UIButton) {
        
        
    }
    //同意户用协议
    
    @IBAction func AgreeAction(_ sender: UIButton) {
        
//        sender.isSelected = !sender.isSelected
//        if sender.isSelected {
//            sender .setTitle("✓", for: UIControlState.normal)
//            LoginBtn.isEnabled = true
//        }else{
//             sender .setTitle("", for: UIControlState.normal)
//            LoginBtn.isEnabled = false
//        }
        
        
    }
    
     // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let isShowHomePage = viewController == self ? true : false
        self.navigationController?.setNavigationBarHidden(isShowHomePage, animated: true)
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
