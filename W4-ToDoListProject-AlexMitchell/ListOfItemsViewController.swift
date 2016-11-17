//
//  ListOfItemsViewController.swift
//  W4-ToDoListProject-AlexMitchell
//
//  Created by Alex Mitchell on 2016-11-15.
//  Copyright © 2016 Alex Mitchell. All rights reserved.
//

import UIKit

class ListOfItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var itemListTableView: UITableView!
    
    var selectedListIndex: Int!
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    
    @IBAction func addTask(_ sender: Any) {
        let newTask = Item(title: taskTitleTextField.text!, description: taskDescriptionTextField.text!)
        
        lists[selectedListIndex].items.append(newTask)
        taskTitleTextField.text = ""
        taskDescriptionTextField.text = ""
        
        itemListTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[selectedListIndex].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! ListTableViewCell
            
            task.taskNameLabel.text = lists[selectedListIndex].items[indexPath.row].title
        //lists[selectedListIndex].items[indexPath.row].description
        return task
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists[selectedListIndex].items.remove(at: indexPath.row)
            itemListTableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let itemDetail = segue.destination as! ItemDetailViewController
        itemDetail.selectedItemIndex = itemListTableView.indexPathForSelectedRow?.row
        itemDetail.selectedListIndex = selectedListIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemListTableView.reloadData()
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
