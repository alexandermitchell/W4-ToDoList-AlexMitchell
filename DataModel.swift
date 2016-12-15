//
//  DataModel.swift
//  W4-ToDoListProject-AlexMitchell
//
//  Created by Alex Mitchell on 2016-11-15.
//  Copyright © 2016 Alex Mitchell. All rights reserved.
//

import Foundation

var lists = [List]()


class List: NSObject, NSCoding {
    
    private struct Keys {
        static let title = "title"
        static let items = "items"
        
    }
    
    var title: String
    var items = [Item]()
    
    init(title: String) {
        self.title = title
    }
    
    required init(coder ADecoder: NSCoder) {
        
        title = ADecoder.decodeObject(forKey: Keys.title) as! String
        items = ADecoder.decodeObject(forKey: Keys.items) as! [Item]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Keys.title)
        aCoder.encode(items, forKey: Keys.items)
    }
}

class Item: NSObject, NSCoding {
    
    private struct Keys {
        static let title = "title"
        static let itemDescription = "itemDescription"
    }
    
    var title: String
    var itemDescription = ""
    
    
    init(title: String, itemDescription: String = "") {
        self.title = title
        self.itemDescription = itemDescription
    }
    
    required init(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: Keys.title) as! String
        itemDescription = aDecoder.decodeObject(forKey: Keys.itemDescription) as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Keys.title)
        aCoder.encode(itemDescription, forKey: Keys.itemDescription)
    }
    
}

class Model {
    
    static let shared = Model()
    private init() {}
    
    let key = "lists"
    
    
    
    func persistListsToDefaults() {
        let data = NSKeyedArchiver.archivedData(withRootObject: lists)
        
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadPersistedListsFromDefaults() {
        if let data = UserDefaults.standard.object(forKey: key) as? Data { let savedLists = NSKeyedUnarchiver.unarchiveObject(with: data) as! [List]
            lists = savedLists
        }
    }
}


