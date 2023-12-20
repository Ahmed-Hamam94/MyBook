//
//  BookTableViewCell.swift
//  MyBook
//
//  Created by Ahmed Hamam on 12/12/2023.
//

import UIKit
import Cosmos

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.clipsToBounds = true
            bookImage.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var ratingsView: CosmosView!
    
    func configure(with model: MyBook) {
        var imageString = model.image
         if imageString.hasPrefix("http://") {
             if let range = imageString.range(of: "http://") {
                 imageString.replaceSubrange(range, with: "https://")
                 bookImage.setImage(imagePath: imageString, placeholderImage: UIImage(named: "notAvailable"))
              
             }
         } else {
             bookImage.setImage(imagePath: imageString, placeholderImage: UIImage(named: "notAvailable"))
       
         }
         
         
         bookTitleLabel.text = model.title
        ratingsView.rating = model.ratingsCount
    }
    
}
