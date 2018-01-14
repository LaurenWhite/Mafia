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
var lobbies: [Lobby] = []

class LobbyDatabase{
    
    init() {
        root = Database.database().reference()
        lobby = root.child("lobbies")
    }
    
    func createLobby(lobbyName: String){
        let newLobby = Lobby(name: lobbyName, members: [username, "Daisy", "Aaren"], playerCount: 3, creator: username)
        let lobbyDict:[String: Any] = [
            "members": newLobby.members,
            "playerCount" : newLobby.playerCount,
            "creator": newLobby.creator
        ]
        lobby.child(newLobby.name).setValue(lobbyDict)
        addMember(username: "Kevin", lobbyName: "ballers")
    }
    
    func addMember(username: String, lobbyName: String){
        lobby.child(lobbyName).child("members").updateChildValues([3: username])
    }
}
