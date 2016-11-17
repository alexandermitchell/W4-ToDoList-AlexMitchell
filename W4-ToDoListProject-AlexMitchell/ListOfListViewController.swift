//
//  ListOfListViewController.swift
//  W4-ToDoListProject-AlexMitchell
//
//  Created by Alex Mitchell on 2016-11-15.
//  Copyright © 2016 Alex Mitchell. All rights reserved.
//

import UIKit

class ListOfListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var listOfListsTableView: UITableView!
    
    
    @IBOutlet weak var newListTextOutlet: UITextField!
    
    @IBAction func addListAction(_ sender: UIButton) {
        
        let newList = List(title: newListTextOutlet.text!)
        
        lists.append(newList)
        
        
        newListTextOutlet.text = ""
        
        listOfListsTableView.reloadData()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListOfListTableViewCell
        
        list.listTitleOutlet.text = lists[indexPath.row].title
        
        return list
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            listOfListsTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listOfItemsViewController = segue.destination as! ListOfItemsViewController
        listOfItemsViewController.selectedListIndex = listOfListsTableView.indexPathForSelectedRow?.row
    }
    
    override func viewDidLoad() {
        
        if let rawList = UserDefaults.standard.array(forKey: "LoL") {
            lists = rawList as! [List]
        }
        super.viewDidLoad()
        
        
    }

    
}
