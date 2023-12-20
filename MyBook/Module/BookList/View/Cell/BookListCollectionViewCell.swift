//
//  BookListCollectionViewCell.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import UIKit

final class BookListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var bookImage: UIImageView! {
        didSet {
            bookImage.clipsToBounds = true
            bookImage.layer.cornerRadius = 20
        }
    }
    @IBOutlet private weak var bookTitle: UILabel!
    
   
    func configure ( with item: MyBook) {
       var imageString = item.image
    
        if imageString.hasPrefix("http://") {
            if let range = imageString.range(of: "http://") {
                imageString.replaceSubrange(range, with: "https://")
                bookImage.setImage(imagePath: imageString, placeholderImage: UIImage(named: "notAvailable"))
            }
        } else {
            bookImage.setImage(imagePath: imageString, placeholderImage: UIImage(named: "notAvailable"))
        }
        
        
        bookTitle.text = item.title
    }
    
    
}
