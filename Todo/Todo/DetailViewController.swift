//
//  DetailViewController.swift
//  Todo
//
//  Created by 万显武 on 2018/3/14.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var chlidBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var shopBtn: UIButton!
    @IBOutlet weak var AirBtn: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    var todo:TodoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo{
            self.title = "Edit Todo"
            self.titleTextField.text = todo.title
            self.DatePicker .setDate(todo.date, animated: false)
            if todo.image == "child-selected"{
                chlidBtn.isSelected = true
            }
            else if todo.image == "phone-selected"{
                phoneBtn.isSelected = true
            }
            else if todo.image == "shopping-cart-selected"{
                shopBtn.isSelected = true
            }
            else if todo.image == "travel-selected"{
                AirBtn.isSelected = true
            }
            
        }else{
            self.title = "Edit Todo"
            self.chlidBtn.isSelected = true
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func childSelectedAction(_ sender: Any) {
        resetButtons()
        chlidBtn.isSelected = true
    }
    
    @IBAction func phoneSelectedAction(_ sender: Any) {
        resetButtons()
        phoneBtn.isSelected = true
    }
    @IBAction func shopSelectedAction(_ sender: Any) {
        resetButtons()
        shopBtn.isSelected = true
    }
    @IBAction func airSelectedAction(_ sender: Any) {
        resetButtons()
        AirBtn.isSelected = true
    }
    
    func resetButtons(){
        chlidBtn.isSelected = false
        phoneBtn.isSelected = false
        shopBtn.isSelected = false
        AirBtn.isSelected = false
    }
    
    @IBAction func actionDone(_ sender: Any) {
        var image : String = ""
        if chlidBtn.isSelected {
            image = "child-selected"
        }else if phoneBtn.isSelected{
            image = "phone-selected"
        }else if shopBtn.isSelected{
            image = "shopping-cart-selected"
        }else if AirBtn.isSelected{
            image = "travel-selected"
        }
        
        if let todo = todo {
            todo.image = image
            todo.title = titleTextField.text!
            todo.date = DatePicker.date
        }else{
            let uuid = UUID().uuidString
            todo = TodoItem(id: uuid, image: image, title: titleTextField.text!, date: DatePicker.date)
            todos.append(todo!)
            
        }
        
        let _ = navigationController?.popToRootViewController(animated: true)
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
