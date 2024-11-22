//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{
    
    let defaults = UserDefaults.standard
    
    var itemArray = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell")
        
        if var content = cell?.defaultContentConfiguration() {
            content.text = itemArray[indexPath.row].task
            
            cell?.contentConfiguration = content
            
        }
        
        cell?.accessoryType = itemArray[indexPath.row].isDone ? .checkmark : .none
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone
        itemArray[indexPath.row].priority = !itemArray[indexPath.row].priority
        saveData()
    }
    
    
    @IBAction func actionButtonPress(_ sender: UIBarButtonItem) {
        let popUp = UIAlertController(title: "Pin Tasks", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Pin Selected Tasks", style: .default) { action in
            self.itemArray.sort { item, item in
                item.priority == true
            }
            self.saveData()
        }
        
        let close = UIAlertAction(title: "Close", style: .cancel) { close in
            self.dismiss(animated: true, completion: nil)
        }
        popUp.addAction(close)
        popUp.addAction(action)
        present(popUp, animated: true, completion: nil)
    }
    
    
    
    @IBAction func trashButtonPress(_ sender: UIBarButtonItem) {
        let popUP = UIAlertController(title: "Clear Items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Clear Selected", style: .destructive) { action in
            self.itemArray.removeAll { item in
                item.isDone == true
            }
//            print(self.itemArray.count)
            self.saveData()
        }
        let clearList = UIAlertAction(title: "Clear All Tasks", style: .destructive) { clear in
            self.itemArray.removeAll()
            self.saveData()
        }
        let close = UIAlertAction(title: "Close", style: .cancel) { close in
            self.dismiss(animated: true, completion: nil)
        }
        popUP.addAction(action)
        popUP.addAction(close)
        popUP.addAction(clearList)
        present(popUP, animated: true, completion: nil)
    }
    
    func saveData() {
        if let encode = try? JSONEncoder().encode(self.itemArray) {
            UserDefaults.standard.setValue(encode, forKey: "TodoListArray")
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func loadData() {
        if let data = UserDefaults().object(forKey: "TodoListArray") as? Data {
            if let decoded = try? JSONDecoder().decode([Item].self, from: data) {
                itemArray = decoded
            }
        }
    }
    
    
    
    @IBAction func addTaskButtonPress(_ sender: UIBarButtonItem) {
        var textFieldContent = UITextField()
        let popUP = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            let newItem = Item()
            newItem.task = textFieldContent.text ?? "default"
            self.itemArray.append(newItem)
            self.saveData()
        }
        let close = UIAlertAction(title: "Close", style: .cancel) { close in
            self.dismiss(animated: true, completion: nil)
        }
        
        popUP.addAction(action)
        popUP.addAction(close)
        popUP.addTextField { textContent in
            textFieldContent = textContent
            textFieldContent.placeholder = "Write your task"
//            action.isEnabled = textFieldContent.hasText ? true : false
        }
        present(popUP, animated: true, completion: nil)
    }
    
}

