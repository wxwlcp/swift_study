//
//  ViewController.swift
//  Todo
//
//  Created by 万显武 on 2018/3/13.
//  Copyright © 2018年 众云车服. All rights reserved.
//

import UIKit

var todos:[TodoItem] = []


class ViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = [   TodoItem(id:"1",image:"child-selected",title:"Go to Disney",date:dateFromString("2014-10-20")!),
                    TodoItem(id:"2",image:"shopping-cart-selected",title:"Cicso Shopping",date:dateFromString("2014-10-28")!),
                    TodoItem(id:"3",image:"phone-selected",title:"Phone to Jobs",date:dateFromString("2014-10-30")!),
                    TodoItem(id:"4",image:"travel-selected",title:"Plan to Europe",date:dateFromString("2014-10-31")!)]
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    func setmessageLabel(_ messageLabel:UILabel,frame:CGRect,text:String,textColor:UIColor,numberOfLines:Int,textAlignment:NSTextAlignment,font:UIFont) {
        messageLabel.frame = frame
        messageLabel.text = text
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = numberOfLines
        messageLabel.textAlignment = textAlignment
        messageLabel.font = font
        messageLabel.sizeToFit()
    }
    
    func setCellWithTodoItem(_ cell:UITableViewCell,todo:TodoItem) -> Void {
        let imageView:UIImageView = cell.viewWithTag(11) as! UIImageView
        let titleLabel: UILabel = cell.viewWithTag(12) as! UILabel
        let dateLabel:UILabel = cell.viewWithTag(13) as! UILabel
        
        imageView.image = UIImage(named:todo.image)
        titleLabel.text = todo.title
        dateLabel.text = stringFromDate(todo.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTodo" {
            let vc =  segue.destination as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            if let indexPath = indexPath{
                vc.todo = todos[(indexPath as NSIndexPath).row]
            }
        }
    }
    //MARK  UITableViewDataSources
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todos.count != 0 {
            return todos.count
        }else{
            let messageLabel:UILabel  = UILabel()
            setmessageLabel(messageLabel, frame: CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height), text: "No data is currently avilabale", textColor: UIColor.black, numberOfLines: 0, textAlignment: NSTextAlignment.center, font: UIFont(name:"Palatino-Italic", size: 20)!)
            self.tableView.backgroundView = messageLabel
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellidentifier:String = "todoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath)
        setCellWithTodoItem(cell, todo: todos[(indexPath as NSIndexPath).row])
        return cell
    }
     //MARK - UITableViewDelegate
    // edit mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        self.tableView.setEditing(editing, animated: true)
    }
    // delete the cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: (indexPath as NSIndexPath).row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //move the cell
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
   override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let todo = todos.remove(at: (sourceIndexPath as NSIndexPath).row)
    todos.insert(todo, at: (destinationIndexPath as NSIndexPath).row)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

