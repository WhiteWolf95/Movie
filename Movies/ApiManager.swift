//
//  ApiManager.swift
//  Movies
//
//  Created by Michael Hughes on 1/29/18.
//  Copyright © 2018 Michael Hughes. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    
    private let BASE_URL = "https://api.themoviedb.org"
    
    func searchMovie(title: String,pageNumber: Int, completion: @escaping (_ data: Data) -> Void) {
        
        let query = title.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        let sUrl: String = "\(BASE_URL)/3/search/movie?api_key=c33e25174af866c5c102772d92d0e480&query=\(query)&page=\(pageNumber)"
        
        Alamofire.request(URL(string:sUrl)!).responseData { (dataResponse) in
            
            if dataResponse.error != nil {
                print(dataResponse.error!)
                return
            }
            
            completion(dataResponse.data!)
        }
    }
    
}
