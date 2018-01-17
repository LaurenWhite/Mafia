//
//  InLobbyViewController.swift
//  Mafia
//
//  Created by Lauren White on 1/16/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class InLobbyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let lobby = Database.database().reference().child("lobbies")
    let lobbyDatabase = LobbyDatabase()
    let playerDatabase = PlayerDatabase()
    
    @IBOutlet weak var lobbyNameLabel: UILabel!
    @IBOutlet weak var memberListTableView: UITableView!
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var lobbyInfoLabel: UILabel!
    
    var lobbyName: String?
    var lobbyCreator: String?
    var curLobby: DatabaseReference!
    var members: [String] = []
    var assignedRoster: [String:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberListTableView.dataSource = self
        memberListTableView.delegate = self
        
        curLobby = Database.database().reference().root.child("lobbies").child(lobbyName!)
        lobbyNameLabel.text = lobbyName!
        observeMembers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func observeMembers(){
        curLobby.child("members").observe(.value) { (snapshot) in
            if let curMembers = snapshot.value as? [String:String]{
                self.members = Array(curMembers.values)
                self.memberListTableView.reloadData()
                self.monitorPlayerCount()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        
        let member = members[indexPath.row]
        cell.textLabel?.text = member
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font.withSize(25)
        return cell
    }
    
    func monitorPlayerCount(){
        let minimum = 6
        
        if (minimum - (members.count)) > 0 {
            lobbyInfoLabel.text = "This lobby needs " + String(minimum - members.count) + " more players."
            startGame.alpha = 0.5
        }else{
            lobbyInfoLabel.text = "Waiting on lobby creator to start the game."
            
            if (username == lobbyCreator){
                startGame.alpha = 1
            }else{
                startGame.alpha = 0.5
            }
        }
    }
    
    @IBAction func startGamePressed(_ sender: UIButton) {
        if (username==lobbyCreator && startGame.alpha==1){
            //initiate game for all players?
            assignedRoster = playerDatabase.assignRoles(members: members)
            performSegue(withIdentifier: "startgame", sender: nil)
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? SleepCycleViewController{
            destination.players = assignedRoster
        }
    }
    

}
