//
//  PlayerListTVC.swift
//  Mafia
//
//  Created by Lauren White on 1/11/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit

class PlayerListTVC: UITableViewController{

    var turn: String? //get passed from previous view controller
    let playerDatabase = PlayerDatabase()
    let selectedCharacter = ""
    var playerOptions: [String] = []
    var votes: [String:Int] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        determinePlayerOptions() //creates player list based on which group/person is awake
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determinePlayerOptions(){
        playerOptions.append(contentsOf: playerDatabase.innocentRoster())
        playerOptions.append(playerDatabase.doctor())
        if turn == "mafia"{
            playerOptions.append(playerDatabase.investigator())
        }else if turn == "investigator"{
            playerOptions.append(contentsOf: playerDatabase.mafiaRoster())
        }else{
            playerOptions.append(playerDatabase.investigator())
            playerOptions.append(contentsOf: playerDatabase.mafiaRoster())
        }
        playerOptions.sort()
    }

    func addVote(playerName: String){
        if votes.keys.contains(playerName){
            votes[playerName] = votes[playerName]! + 1
        }else{
            votes[playerName] = 1
        }
        print(votes)
    }
    
    func mostVotes() -> String{
        var max = 0
        var winner = ""
        for candidate in votes.keys{
            if votes[candidate]! >= max{
                max = votes[candidate]!
                winner = candidate
            }
        }
        return winner
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(playerDatabase.playerCount())
        return playerOptions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playercell", for: indexPath)
        let player = playerOptions[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = player
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VotedViewController,
            let tableViewCell = sender as? UITableViewCell,
            let index = tableView.indexPath(for: tableViewCell)?.row{
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            let selectedPlayer = playerOptions[index]
            destination.selectedPlayer = selectedPlayer
        }
    }
}
