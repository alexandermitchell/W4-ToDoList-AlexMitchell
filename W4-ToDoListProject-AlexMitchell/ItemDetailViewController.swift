//
//  ItemDetailViewController.swift
//  W4-ToDoListProject-AlexMitchell
//
//  Created by Alex Mitchell on 2016-11-15.
//  Copyright © 2016 Alex Mitchell. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    
    
    var selectedListIndex: Int!
    var selectedItemIndex: Int!
    
    
    
    @IBOutlet weak var taskExpandedDescriptionTextField: UITextView!
    
    @IBOutlet weak var taskExpandedTitleTextField: UITextField!
    
    
    @IBAction func itemSaveAction(_ sender: UIButton) {
        
        let saveitem = lists[selectedListIndex].items[selectedItemIndex]
        
        saveitem.title = taskExpandedTitleTextField.text!
        saveitem.description = taskExpandedDescriptionTextField.text!
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let item = lists[selectedListIndex].items[selectedItemIndex]
        
        taskExpandedTitleTextField.text = item.title
        taskExpandedDescriptionTextField.text = item.description
        
        // Do any additional setup after loading the view.
    }

}
