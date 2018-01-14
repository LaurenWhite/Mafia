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
    
    @IBOutlet weak var lobbyNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createLobbyPressed(_ sender: Any) {
        let input = lobbyNameTextField.text
        if input != "" {
            lobbyDatabase.createLobby(lobbyName: input!)
        }
        performSegue(withIdentifier: "joinedlobby1", sender: nil)
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
