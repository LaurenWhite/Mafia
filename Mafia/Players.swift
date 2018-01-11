//
//  Players.swift
//  Mafia
//
//  Created by Lauren White on 1/11/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import Foundation

//Sample Data
private var players: [String:[String]] = [//Player:Role
    "mafia": ["player1"],
    "investigator": ["player4"],
    "doctor": ["player6"],
    "innocent": ["player2","player3","player5","player7"]
    ]

class PlayerDatabase{
    
    func playerCount() -> Int{
        return players.count
    }
    
    func mafiaRoster() -> [String]{
        return players["mafia"]!
    }
    
    func doctor() -> String{
        return players["doctor"]![0]
    }
    
    func innocentRoster() -> [String]{
        return players["innocent"]!
    }
    
    func investigator() -> String{
        return players["investigator"]![0]
    }
}
