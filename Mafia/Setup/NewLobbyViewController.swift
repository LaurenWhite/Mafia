//
//  NewLobbyViewController.swift
//  Mafia
//
//  Created by Lauren White on 1/13/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit

class NewLobbyViewController: UIViewController {

    let lobbyDatabase = LobbyDatabase()
    let inLobby = InLobbyViewController()
    var lobbyName = ""
    
    @IBOutlet weak var lobbyNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createLobbyPressed(_ sender: Any) {
        let input = lobbyNameTextField.text
        if input != "" {
            lobbyName = input!
            lobbyDatabase.createLobby(lobbyName: lobbyName)
        }
        performSegue(withIdentifier: "joinedlobby1", sender: nil)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InLobbyViewController {
            destination.lobbyName = lobbyName
            destination.lobbyCreator = username
        }
        
    }
    

}
