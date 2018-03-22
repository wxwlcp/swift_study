//
//  UserNameTextField.swift
//  chege
//
//  Created by 万显武 on 2018/1/26.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class UserNameTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x:12,y:10,width:20,height:20);
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x:bounds.origin.x+40, y:bounds.origin.y, width:bounds.size.width-55, height:bounds.size.height);//更好理解些
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x:bounds.origin.x+40, y:bounds.origin.y, width:bounds.size.width-55, height:bounds.size.height);//更好理解些
    }
    //展示文字区域的
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x:bounds.origin.x+40, y:bounds.origin.y, width:bounds.size.width-55, height:bounds.size.height);//更好理解些
    }

}
