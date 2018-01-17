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
    
    @IBOutlet weak var lobbyNameLabel: UILabel!
    @IBOutlet weak var memberListTableView: UITableView!
    
    var lobbyName: String?
    var curLobby: DatabaseReference!
    var members: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberListTableView.dataSource = self
        memberListTableView.delegate = self
        
        
        curLobby = Database.database().reference().root.child("lobbies").child(lobbyName!)
        lobbyNameLabel.text = lobbyName!
        print("GOT HERE!")
        print(members)
        observeMembers()
        print(members)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func observeMembers(){
        //func observeMessages() {
            //YOUR CODE HERE
            /*root.child("chat").observe(.value, with: {(snapshot) in
             if let messages = snapshot.value as? [String:String]{
             self.messages = Array(messages.values)
             self.tableView.reloadData()
             //print(messages)
             }
             })*/
            
        curLobby.child("members").observe(.value) { (snapshot) in
            if let curMembers = snapshot.value as? [String:String]{
                self.members = Array(curMembers.values)
                print(curMembers)
                print(self.members)
                self.memberListTableView.reloadData()
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
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
