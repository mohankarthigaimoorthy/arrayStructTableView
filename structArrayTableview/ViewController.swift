//
//  ViewController.swift
//  structArrayTableview
//
//  Created by Mohan K on 16/02/23.
//

import UIKit

class ViewController: UIViewController {
    struct Task : Codable {
        var taskName: String
        var status: Int
        var priority: Int
    }
    
    var allTasks = [Task (taskName: "default", status: 1, priority: 3)]
    
    @IBOutlet weak var taskNameText: UITextField!
    
    @IBOutlet weak var prioritySegmentControl: UISegmentedControl!
 
    @IBAction func saveNewTask(_ sender: Any) {
        let newTask = Task(taskName: taskNameText.text!, status: 1,priority: prioritySegmentControl .selectedSegmentIndex)
        allTasks.append(newTask)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(allTasks), forKey: "SavedTasks")
    
//        allTasks.startIndex.backgroundColor = UIColor.cyan
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
            allTasks = try! PropertyListDecoder() .decode(Array<Task>.self, from: myData)}        }


}

