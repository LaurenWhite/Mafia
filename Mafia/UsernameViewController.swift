//
//  UsernameViewController.swift
//  Mafia
//
//  Created by Lauren White on 1/13/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit

var username = "Lauren"

class UsernameViewController: UIViewController {

    @IBOutlet weak var usernameTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func continuePressed(_ sender: Any) {
        let input = usernameTextBox.text
        if input != "" {
            username = input!
            print(username)
        }
        self.performSegue(withIdentifier: "abc", sender: nil)
    }
    
}
