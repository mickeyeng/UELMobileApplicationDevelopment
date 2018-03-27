//
//  MovieTableViewCell.swift
//  myMovie2
//
//  Created by Mickey English on 27/03/2018.
//  Copyright © 2018 Mickey English. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
