//
//  MovieModel.swift
//  myMovie2
//
//  Created by Mickey English on 27/03/2018.
//  Copyright © 2018 Mickey English. All rights reserved.
//

class MovieModel {
    var id: String?
    var name: String?
    var genre: String?
    var description: String?
    var rating: String?
    
    // add this for more  description:String?, rating:String?
    init(id:String?, name:String?, genre:String?) {
        self.id = id
        self.name = name
        self.genre = genre
//        self.description = description
//        self.rating = rating
        
    }
}
