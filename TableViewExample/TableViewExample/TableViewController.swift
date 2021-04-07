//
//  TableViewController.swift
//  TableViewExample
//
//  Created by user on 15.03.21.
//

import UIKit

class TableViewController: UITableViewController {

    var model = Model()
    let postsURL = "https://api.pandascore.co/lol/champions?sort=name&per_page=100&page="
    let url2 = "&token=IMkUa0X-2n231_13d_T_muOA-XIWNYQ2Jd-W_mDMcDZHXMV558o"
    var pageNum:int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        /*
        let person1 = Person()
        person1.firstname = "Max"
        person1.lastname = "Mustermann"
        model.persons.append(person1)
        
        let person2 = Person()
        person2.firstname = "Maria"
        person2.lastname = "Musterfrau"
        model.persons.append(person2)
        
        let person3 = Person()
        person3.firstname = "John"
        person3.lastname = "Doe"
        model.persons.append(person3)
        */
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData(){
        var apiurl;
        if let url = URL(string:apiurl){
            for i in 0...2{
                if let data = try? Data(contentsOf: url){
                    print(data)
                    if let json = try? JSONSerialization.jsonObject(with: data){
                        if let posts = json as? [[String: Any]]{
                            for post in posts {
                                let tempPost = Post()
                                tempPost.name = post["name"] as! String
                                model.posts.append(tempPost)
                                
                            }
                        }
                    }
                }
                pageNum+=1;
            }
            
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)

        let tempPost = model.posts[indexPath.row]

        cell.textLabel?.text=tempPost.name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
