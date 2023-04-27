//
//  twoTableViewController.swift
//  structArrayTableview
//
//  Created by Mohan K on 16/02/23.
//

import UIKit

//class tableList : UITableViewCell{
//
//
//    @IBOutlet weak var text1: UILabel!
//
//    @IBOutlet weak var text2: UILabel!
//}

class twoTableViewController: UITableViewController {
    
   
    @IBOutlet var mytableTwo: UITableView!
    struct Task : Codable {
        var taskName: String
        var status: Int
        var priority: Int
    }
    
    var allTasks = [Task(taskName: "default", status: 1, priority: 1)]
    var point = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
//      friend = loadData()
        mytableTwo.delegate = self
        mytableTwo.dataSource = self
       
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
         allTasks = try!
            PropertyListDecoder().decode(Array<Task>.self, from: myData)
        }
    }
//    func loadData() {
//        var allTask = [Taskable(taskName: "default", status: 1, priority: 1)]
//    }
    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allTasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableTwo.dequeueReusableCell(withIdentifier: "cell")
//        as! tableList
//        let friends = friend[indexPath.row]
        cell?.textLabel?.text = allTasks[indexPath.row].taskName
return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
            allTasks = try! PropertyListDecoder().decode(Array<Task>.self, from: myData)
//            let pointInTable: CGPoint =         sender.convertPoint(sender.bounds.origin, toView: self.mytableTwo)
//            let cellIndexPath = self.mytableTwo.indexPathForRow(at: pointInTable)
//              println(cellIndexPath)
//              point = cellIndexPath!.row
//              println(point)
        }
        self.mytableTwo.reloadData()
    }
   
}
