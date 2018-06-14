//
//  ViewModel.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var items : [Items]?
    
    func searchBookByString(searchText:String?, completion: @escaping (Error?) -> Void){
        
        let networkAPI = NetworkApi.shared
        networkAPI.searchBookByString(searchText: searchText){ (data, error) in
            
            guard let data = data else{
                completion(error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let searchResult = try decoder.decode(SearchResults.self, from: data)
                DispatchQueue.main.async {
                    self.items = searchResult.items
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func bookToDisplay(for indexPath: IndexPath) -> Items {
        return (items?[indexPath.item])!
    }
}
