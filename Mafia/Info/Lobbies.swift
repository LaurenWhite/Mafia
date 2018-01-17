//
//  Lobbies.swift
//  Mafia
//
//  Created by Lauren White on 1/13/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Lobby{
    var name: String
    var members: [String]
    var playerCount: Int
    var creator: String
}

var root: DatabaseReference!
var lobby: DatabaseReference!

class LobbyDatabase{
    
    var currentCount: Int
    
    init() {
        root = Database.database().reference()
        lobby = root.child("lobbies")
        currentCount = 0
    }
    
    func createLobby(lobbyName: String){
        let newLobby = Lobby(name: lobbyName, members: [], playerCount: 1, creator: username)
        let lobbyDict:[String: Any] = [
            "members": newLobby.members,
            "playerCount" : newLobby.playerCount,
            "creator": newLobby.creator
        ]
        lobby.child(newLobby.name).setValue(lobbyDict)
        lobby.child(newLobby.name).child("members").childByAutoId().setValue(newLobby.creator)
        //addMember(username: "Kevin", lobbyName: "kiddos")
    }
    
    func addMember(username: String, lobbyName: String){
        lobby.child(lobbyName).child("members").childByAutoId().setValue(username)
        
        lobby.child(lobbyName).child("playerCount").observeSingleEvent(of: .value) { (snapshot) in
            if let currentCount = snapshot.value as? Int {
                self.currentCount = currentCount
                let newCount = currentCount + 1
                lobby.child(lobbyName).child("playerCount").setValue(newCount)
            }
        }
    }
    
    func deleteEmptyLobbies(){
            
    }
        
}
