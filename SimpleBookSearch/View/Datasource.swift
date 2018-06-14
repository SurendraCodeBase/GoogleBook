//
//  Datasource.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import UIKit

class Datasource: NSObject, UICollectionViewDataSource {

    var viewModel:ViewModel!
    
    func object(at indexPath: IndexPath) -> Items {
        
        return viewModel.bookToDisplay(for:indexPath)
    }

    // MARK: Collectionview methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if viewModel == nil {
            return 0
        }
        return viewModel.numberOfItemsToDisplay(in: section)
        
    }
  

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell

        let item = object(at: indexPath)
        cell.fill(with: item)

        return cell
    }

}
