//
//  ViewController.swift
//  Closure
//
//  Created by 万显武 on 2018/3/22.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SecondTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func tapGoSecondViewControllerButton(_ sender: Any) {
        
        let secondVC = UIStoryboard(name:"Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondVC.setBackMyClosure{ (inputText:String) in
            self.SecondTextField.text = inputText
        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

