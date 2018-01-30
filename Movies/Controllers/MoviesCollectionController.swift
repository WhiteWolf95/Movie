//
//  MoviesCollectionController.swift
//  Movies
//
//  Created by Michael Hughes on 1/29/18.
//  Copyright © 2018 Michael Hughes. All rights reserved.
//

import UIKit

class MoviesCollectionController: UICollectionViewController {
    
    let apiManager = ApiManager()
    var arrayOfMovies: [MovieModel] = []
    var name: String!
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovies(title: name, page: page)
    }
    
    private func loadMovies(title: String, page: Int){
        
        apiManager.searchMovie(title: title, pageNumber: page) { (data) in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:AnyObject]
                if json["results"] != nil {
                    let movies = json["results"] as! NSArray
                    
                    for i in 0..<movies.count {
                        
                        let dictionary = movies[i] as! [String:AnyObject]
                        
                        guard let id = dictionary["id"] as? Int,
                            let smallImage = dictionary["backdrop_path"] as? String,
                            let title = dictionary["original_title"] as? String,
                            let release = dictionary["release_date"] as? String,
                            let overview = dictionary["overview"] as? String,
                            let posterImage = dictionary["poster_path"] as? String else { return }
                        
                        self.arrayOfMovies.append(MovieModel(id: id, backdropUrl: smallImage, posterUrl: posterImage, title: title, releaseDate: release, overview: overview))
                        
                        self.collectionView?.reloadData()
                        
                    }
                }
                
            } catch {
                
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfMovies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == arrayOfMovies.count - 1 {
            page = page + 1
            loadMovies(title: name, page: page)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.MOVIE_DETAILS_CONTROLLER) as? MovieDetailsViewController
        detailVC?.movie = arrayOfMovies[indexPath.row]
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.MOVIE_CELL, for: indexPath) as! MovieCollectionCell
        
        cell.imgMovie.loadImageFromURL(urlString: "\(Constants.BASE_IMAGE_URL)\(self.arrayOfMovies[indexPath.row].backdropUrl!)")
        cell.lblTitle.text = arrayOfMovies[indexPath.row].title
        
        return cell
    }
    
}
