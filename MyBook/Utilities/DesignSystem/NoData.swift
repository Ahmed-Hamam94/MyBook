//
//  NoData.swift
//  MyBook
//
//  Created by Ahmed Hamam on 13/12/2023.
//

import UIKit

class NoData: UIView {

   lazy var NoDataImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "no")
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFit
       image.frame = self.bounds
        return image
    }()
    
  
    
}
