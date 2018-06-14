//
//  CollectionCell.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 4.0

        titleLabel.textColor = UIColor(red: 43.0/255.0, green: 58.0/255.0, blue: 66.0/255.0, alpha: 1.0)
        addressLabel.textColor = UIColor(red: 63.0/255.0, green: 87.0/255.0, blue: 101.0/255.0, alpha: 1.0)
    }

    func fill(with book: Items) {
        titleLabel.text = book.volumeInfo?.title
        addressLabel.text = book.volumeInfo?.authors?.first

        URLSession.shared.dataTask(with: NSURL(string: (book.volumeInfo?.imageLinks?.smallThumbnail)!)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.imageView.image = image
            })
            
        }).resume()
    }
}
