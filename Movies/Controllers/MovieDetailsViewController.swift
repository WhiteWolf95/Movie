//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Michael Hughes on 1/29/18.
//  Copyright © 2018 Michael Hughes. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRelease: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    var movie: MovieModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        fillViews()
    }
    
    private func fillViews(){
        
        imgPoster.loadImageFromURL(urlString: "\(Constants.BASE_IMAGE_URL)\(movie.posterUrl!)")
        lblTitle.text = movie.title
        lblRelease.text = movie.releaseDate
        lblOverview.text = movie.overview
        lblTitle.sizeToFit()
        lblOverview.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
