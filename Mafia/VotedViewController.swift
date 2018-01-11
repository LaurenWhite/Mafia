//
//  VotedViewController.swift
//  Mafia
//
//  Created by Lauren White on 1/11/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit

class VotedViewController: UIViewController {

    var selectedPlayer: String?
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameLabel.text? = selectedPlayer!
        PlayerListTVC().addVote(playerName: selectedPlayer!)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
