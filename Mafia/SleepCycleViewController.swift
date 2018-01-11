//
//  SleepCycleViewController.swift
//  Mafia
//
//  Created by Lauren White on 1/11/18.
//  Copyright © 2018 Lauren White. All rights reserved.
//

import UIKit

class SleepCycleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func everyoneSleep(){
        //Display moon image
        //Give message: Everyone close your eyes
    }
    
    func wakeMafia(){
        //Audio message: Mafia open your eyes
        //Display ON MAFIA SCREEN ONLY      //All other screens keep moon image
        //Give list of non-mafia characters
        //Mafia must vote on who is killed
        //Person with most votes dies, or tie a person is randomly selected from the tie
        //Give message to mafia: Close your eyes
        //Return to moon image
        
    }
    
    func wakeInvestigator(){
        //Audio message: Investigator open your eyes
        //Display ON INVESTIGATOR SCREEN ONLY       //All other screens keep moon image
        //Give list of all other characters
        //Investigator can select one, reveal the chosen characters role
        //Give message to investigator: Close your eyes
        //Return to moon image
    }
    
    func wakeDoctor(){
        //Audio message: Doctor open your eyes
        //Display ON DOCTOR SCREEN ONLY       //All other screens keep moon image
        //Give list of all characters
        //Doctor can select one, give immunity for the night
        //Give message to doctor: Close your eyes
        //Return to moon image
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
