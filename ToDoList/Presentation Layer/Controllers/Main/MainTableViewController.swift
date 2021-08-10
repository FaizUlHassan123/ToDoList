//
//  MainTableViewController.swift
//  ToDoList
//
//  Created by Faiz Ul Hassan on 7/24/21.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var data:[String] = []
    
    @IBOutlet weak var addbutton:UIBarButtonItem!
    
    @IBAction func addButton(_ sender:UIButton){
        alert()
    }
    
    @IBOutlet weak var clearButton:UIBarButtonItem!
    
    @IBAction func clear(_ sender:UIButton){
        Alert.showConfirmationAlert(vc: self, title: "Are you sure you want to delete all data", message: "", actionTitle1: "ok", actionTitle2: "Cancel") { _ in
            
            for _ in 0..<self.data.count{
                UIView.transition(with: self.tableView, duration: 0.6,
                                  options: .curveEaseIn,
                                  animations: {
                                    self.delete()
                                    
                                  })
            }
            
        } handler2: { _ in
            print("Cancel btn")
        }
        
        
    }
    
    func delete(){
        for i in 0..<self.data.count{
            let indexPath = IndexPath(row: i, section: 0)
            self.data.remove(at: i)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            //            self.tableView.reloadData()
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    func alert(){
        let alertController = UIAlertController(title: "Add item", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = "item name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (result : UIAlertAction) -> Void in
        }
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            let new_string = alertController.textFields![0].text?.trimmingCharacters(in: .whitespacesAndNewlines)
            guard let new = new_string?.trimmingCharacters(in: .whitespacesAndNewlines),!new.isEmpty else{
                return
            }
            if let index2 = self.data.firstIndex(where: {$0 == new_string}) {
                let indexPath = IndexPath(row: index2, section: 0)
                self.data.remove(at: index2)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
                
                self.data.insert(alertController.textFields![0].text!, at: 0)
            }else{
                self.data.insert(alertController.textFields![0].text!, at: 0)
                
            }
            //                self.de
            
            // insert row in table
            self.tableView.beginUpdates()
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            self.tableView.endUpdates()
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let d = data[indexPath.row]
        cell.textLabel?.text = d
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
