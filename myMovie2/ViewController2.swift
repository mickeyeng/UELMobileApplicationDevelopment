//
//  ViewController2.swift
//  myMovie2
//
//  Created by Mickey English on 26/03/2018.
//  Copyright © 2018 Mickey English. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(Auth.auth().currentUser?.email)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        // sign out user
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cinemaButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segueCinema", sender: self)
    }
}
