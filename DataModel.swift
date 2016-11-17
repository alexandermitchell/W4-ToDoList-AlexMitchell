//
//  DataModel.swift
//  W4-ToDoListProject-AlexMitchell
//
//  Created by Alex Mitchell on 2016-11-15.
//  Copyright © 2016 Alex Mitchell. All rights reserved.
//

import Foundation

var lists = [List]()


class List {
    
    var title: String
    var items = [Item]()
    
    init(title: String) {
        self.title = title
    }
    
}

class Item {
    
    var title: String
    var description = ""
    
    init(title: String, description: String = "") {
        self.title = title
        self.description = description
    }
    
}


