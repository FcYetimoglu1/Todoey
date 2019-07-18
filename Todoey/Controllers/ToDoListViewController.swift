//
//  ViewController.swift
//  Todoey
//
//  Created by CAN on 14.07.2019.
//  Copyright © 2019 CAN. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray=[Item]()
    
    let defaults = UserDefaults.standard // uygulama kapatıldıgında eklenen itemleri kaydetme
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title="Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title="Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title="Destroy Demogorgon"
        itemArray.append(newItem3)
        
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] { // uygulama kapatıldıgında eklenen itemleri kaydetme
            itemArray = items
        }
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count  //creates  cells
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text=item.title
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
       
        return cell  //reusable cell
    }
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
  //Adding checkmark whne you clicked on it and removing again
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       
       tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true) // to get rid of grey background color when it selected
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPress(_ sender: UIBarButtonItem) {
        
        var textField=UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the add item button on our UIAlert
            
            let newItem = Item() //creating new item
            newItem.title=textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray") // uygulama kapatıldıgında eklenen itemleri kaydetme
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder="Create new item" // textfield da gri renkte yazan yazı
            textField=alertTextField
        
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
}

