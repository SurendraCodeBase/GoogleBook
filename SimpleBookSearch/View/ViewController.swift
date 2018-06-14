//
//  ViewController.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModel!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarTopConstrait: NSLayoutConstraint!
    
    var presenter: Presenter!
    
    // MARK: View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Book Search"
        setup()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    func setup() {
        searchBar.placeholder = "Search"
        presenter = Presenter(viewController: self)
        searchBar.delegate = presenter
        collectionView.dataSource = presenter.datasource
        collectionView.delegate = presenter
        searchBarTopConstrait.constant = 0.0
        addCollectionViewObserver()

    }
    
    func addCollectionViewObserver() {
        collectionView.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keypath = keyPath, keypath == "contentOffset", let collectionView = object as? UICollectionView {
            searchBarTopConstrait.constant = -1 * collectionView.contentOffset.y
        }
    }
    
    func reloadView() {
        collectionView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        collectionView.removeObserver(self, forKeyPath: "contentOffset")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

