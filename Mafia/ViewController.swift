//
//  ViewController.swift
//  Mafia
//
//  Created by Lauren White on 1/9/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    struct Lobby{
        var members: [String] = []
        var playerCount = 0
        var creator = "None"
    }
    
    var root: DatabaseReference!
    var lobbies: [Lobby] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

