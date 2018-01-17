//
//  JoinLobbyTVC.swift
//  Mafia
//
//  Created by Lauren White on 1/17/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class JoinLobbyTVC: UITableViewController {

    var lobbies: [String] = []
    
    let lobbyList = Database.database().reference().child("lobbies")
    let lobbyDatabase = LobbyDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lobbies = []
        observeLobbies()
    }

    func observeLobbies(){

        lobbyList.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children.allObjects{
                let snap = child as! DataSnapshot
                self.lobbies.append(snap.key)
                //if let snapshotValue = snapshot.value as? NSDictionary, let snapVal = snapshotValue[snap.key] as? AnyObject {
                //print("val" , snapVal)
                //}
            }
            self.tableView.reloadData()
        })
            
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lobbies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lobbyCell", for: indexPath)
        let lobby = lobbies[indexPath.row]
        cell.textLabel?.text = lobby
        //cell.textLabel?.textColor = UIColor.white
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InLobbyViewController,
            let tableViewCell = sender as? UITableViewCell,
            let index = tableView.indexPath(for: tableViewCell)?.row{
                let selectedLobby = lobbies[index]
                destination.lobbyName = selectedLobby
                lobbyDatabase.addMember(username: username, lobbyName: selectedLobby)
        }
    }

}
