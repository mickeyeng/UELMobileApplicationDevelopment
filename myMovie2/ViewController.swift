//
//  ViewController.swift
//  myMovie2
//
//  Created by Mickey English on 26/03/2018.
//  Copyright © 2018 Mickey English. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: UIButton) {
        if emailInput.text != "" && passwordInput.text != "" {
            if segmentControl.selectedSegmentIndex == 0 {
                
                // login with firebase
                Auth.auth().signIn(withEmail: emailInput.text!,  password: passwordInput.text!, completion: { (user, error)  in
                    if user != nil {
                        // user sucessfully signs in
                        print("Sucessfully signed in!")
                    } else {
                        
                        if let myError = error?.localizedDescription {
                            print(myError)
                        } else {
                            print("Error")
                        }
                        
                    }
                    
                })
            } else {
                //signUp
                Auth.auth().createUser(withEmail: emailInput.text!, password: passwordInput.text!, completion: { (user, error) in
                    
                    if user != nil {
                        print("Sucessfully signed up!")
                    } else {
                        
                        if let myError = error?.localizedDescription {
                            print(myError)
                        } else {
                            print("Error")
                        }
                        
                    }
                    
                })
            }
        }
    }
    
}

