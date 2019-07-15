//
//  ViewController.swift
//  Todoey
//
//  Created by CAN on 14.07.2019.
//  Copyright © 2019 CAN. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray=["Find Mike", "Buy Egges", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count  //creates 3 cells
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text=itemArray[indexPath.row]
        
        return cell  //reusable cell
    }
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
  //Adding checkmark whne you clicked on it and removing again
        if         tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
                   tableView.cellForRow(at: indexPath)?.accessoryType = .none

        } else {
                   tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }

        
        tableView.deselectRow(at: indexPath, animated: true) // to get rid of grey background color when it selected
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPress(_ sender: UIBarButtonItem) {
        
        var textField=UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the add item button on our UIAlert
            
            self.itemArray.append(textField.text!)
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

