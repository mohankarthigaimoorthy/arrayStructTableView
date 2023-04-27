//
//  firstTableViewController.swift
//  structArrayTableview
//
//  Created by Mohan K on 16/02/23.
//

import UIKit
//class mycustomCell: UITableViewCell {
//
//    @IBOutlet weak var theTitle: UILabel!
//
//    @IBOutlet weak var thePriority: UILabel!
//}
class firstTableViewController: UITableViewController {
    
    @IBOutlet var taskList: UITableView!
    
    struct Task : Codable {
        var taskName: String
        var status: Int
        var priority: Int
//        var client : [Client]
    }
    
    var allTasks = [Task(taskName: "default", status: 1, priority: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskList.delegate = self
        taskList.dataSource = self
        
//        allTasks.Task[10].view.backgroundColor = UIColor.cyan
        
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
            allTasks = try! PropertyListDecoder().decode(Array<Task>.self, from: myData)
            
        }
    }

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allTasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = taskList.dequeueReusableCell(withIdentifier: "myCell")
//        as! mycustomCell
       
     cell?.textLabel?.text  = allTasks[indexPath.row].taskName
        cell?.accessibilityElementCount()
        print(cell as Any)
//        cell?.backgroundColor = UIColor.brown
        
//        cell?.isSelected.backgroundColor = UIColor.cyan
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
//
//        if let myData = taskList.index(ofAccessibilityElement: {$1.status == $1.status }){
//            myData.contentView.backgroundColor = UIColor.cyan
//
//        }
//        if let myData = Task.index(where: { $3.taskName.text == taskList})
//        {
//            myData.contentView.backgroundColor = UIColor.systemCyan
//        }
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
            allTasks = try! PropertyListDecoder().decode(Array<Task>.self, from: myData)
  
        }
        self.taskList.reloadData()
    }
   
}
