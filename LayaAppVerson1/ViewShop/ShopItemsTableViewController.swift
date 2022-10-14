//
//  ShopItemsTableViewController.swift
//  LayaAppVerson1
//
//  Created by 蔡勝宇 on 2022/10/14.
//

import UIKit

class ShopItemsTableViewController: UITableViewController {
    
    @IBOutlet weak var shopSellImage: UIImageView!
    
    @IBOutlet weak var shopSellName: UILabel!
    
    @IBOutlet weak var shopSellPrice: UILabel!
    
    var shopSellPrice1 = ""
    var shopSellName1 = ""
    var shopSellImage1:UIImage?
     
    static var list:DataShopItem?
    override func viewDidLoad() {
        shopSellPrice.text = shopSellPrice1
        shopSellName.text = shopSellName1
        ShopItemController.shared.fetchshopListItem { result
            in
            switch result{
            case .success(let respones):
                ShopItemsTableViewController.list = respones
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(respones)
                
            case .failure(_):
                print("error")
            }
        }
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  ShopItemsTableViewController.list?.records.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopItemsTableViewCell", for: indexPath) as! ShopItemsTableViewCell
        let lists = ShopItemsTableViewController.list?.records[indexPath.row]
        cell.itemsName.text = lists?.fields.nameItem
        cell.itemsPrice.text = lists?.fields.priceItem 
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
