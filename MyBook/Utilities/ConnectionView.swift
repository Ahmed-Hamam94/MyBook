//
//  ConnectionView.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import UIKit

class ConnectionView: UIView {

   lazy var connectionImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "No Connection")
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFit
       image.frame = self.bounds
        return image
    }()
    
  
    
}
