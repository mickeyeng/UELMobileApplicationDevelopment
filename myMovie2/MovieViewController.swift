//
//  MovieViewController.swift
//  myMovie2
//
//  Created by Mickey English on 27/03/2018.
//  Copyright © 2018 Mickey English. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore


class MovieViewController: UIViewController {

    @IBOutlet weak var inputMovieName: UITextField!
    @IBOutlet weak var inputMovieGenre: UITextField!
    
     @IBOutlet weak var sucessLabel: UILabel!
    
    var refMovies: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        
        // get movie names from firebase db
        refMovies = Database.database().reference().child("movies")
        
        
    }
    
    // function to store the data to the db
    func addMovies() {
        // tis will generte a unique id for the reference
        let key = refMovies.childByAutoId().key
        
        let movies = [
            "id":key,
            "movieName": inputMovieName.text! as String,
            "movieGenre": inputMovieGenre.text! as String
        ]
        
        sucessLabel.text = "Artist added! "
        
        refMovies.child(key).setValue(movies )
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

    @IBAction func addButton(_ sender: UIButton) {
        addMovies()
    }
    
    @IBAction func backBtnMovie(_ sender: UIButton) {
        performSegue(withIdentifier: "segueMovieBack", sender: self)
    }
    
}
