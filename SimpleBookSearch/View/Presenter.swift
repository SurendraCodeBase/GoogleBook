//
//  Presenter.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import UIKit

class Presenter: NSObject, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    weak var viewController: ViewController?
    var datasource: Datasource = Datasource()
    let viewModel = ViewModel()
    init(viewController: ViewController?) {
        super.init()
        self.viewController = viewController
    }


    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        viewController?.reloadView()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        
        viewModel.searchBookByString(searchText: searchBar.text) { (error) in
            if let error = error {
                let alertController = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                }
                
                alertController.addAction(action)
                self.viewController?.present(alertController, animated: true, completion: nil)
            }else{
                self.datasource.viewModel = self.viewModel
                self.viewController?.reloadView()
            }
        }
        
        return true
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: (viewController?.searchBar.frame.height ?? 0.0) + 10.0, left: 15.0, bottom: 10.0, right: 15.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let edgeInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        return CGSize(width: collectionView.frame.width - edgeInsets.left - edgeInsets.right, height: 92.0)
    }

}
