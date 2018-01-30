//
//  MoviewModel.swift
//  Movies
//
//  Created by Michael Hughes on 1/29/18.
//  Copyright © 2018 Michael Hughes. All rights reserved.
//

import Foundation

class MovieModel {
    var id: Int!
    var backdropUrl: String!
    var posterUrl: String!
    var title: String!
    var releaseDate: String!
    var overview: String!
    
    init(id: Int, backdropUrl: String, posterUrl: String, title: String, releaseDate: String, overview: String) {
        self.id = id
        self.backdropUrl = backdropUrl
        self.posterUrl = posterUrl
        self.title = title
        self.releaseDate = releaseDate
        self.overview = overview
    }
}
