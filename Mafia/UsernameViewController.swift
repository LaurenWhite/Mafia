//
//  UsernameViewController.swift
//  Mafia
//
//  Created by Lauren White on 1/13/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit

var username = ""

class UsernameViewController: UIViewController {

    @IBOutlet weak var usernameTextBox: UITextField!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnPressed(_ sender: Any) {
        let input = usernameTextBox.text
        if input != "" {
            username = input
        }
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
