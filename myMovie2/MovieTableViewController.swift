//
//  MovieTableViewController.swift
//  myMovie2
//
//  Created by Mickey English on 27/03/2018.
//  Copyright © 2018 Mickey English. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore

class MovieTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
    
    

    @IBOutlet weak var tableMovie: UITableView!
    
    var refMovies: DatabaseReference!
    
    // store array of movies
    var moviesList = [MovieModel]()
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie: MovieModel
        
        movie = moviesList[indexPath.row]
        
        cell.movieNameLabel.text = movie.name
        cell.movieGenreLabel.text = movie.genre
        
        return cell
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refMovies = Database.database().reference().child("movies")
        
        
        // this method will be called if we change any data in the firebase db
        refMovies.observe(DataEventType.value, with:{(snapshot) in
            
            // if we have data in the firebase db we will clear the data then fetch all new data
            if snapshot.childrenCount > 0 {
                self.moviesList.removeAll()
                
                
                
                
                for movies in snapshot.children.allObjects as![DataSnapshot] {
                    let movieObject = movies.value as? [String: AnyObject]
                    let movieName = movieObject?["movieName"]
                    let movieGenre = movieObject?["movieGenre"]
                    let movieId = movieObject?["movieId"]
//                    let movieDescription = movieObject?["movieDescription]
//                    let movieRating = movieObject?["movieDescription]
                    
                    
                    
                    let movie = MovieModel(id: movieId as! String?, name: movieName as! String?, genre: movieGenre as! String?)
                    
                    
                    // store all the movies in the list
                    self.moviesList.append(movie)
                    
                    
                    
                    
                    
                }
                
                // teload the table data
                self.tableMovie.reloadData()
            }
            
            
        })

        // Do any additional setup after loading the view.
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

}
