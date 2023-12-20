//
//  UIImage+Extension.swift
//  DesignSystemExample
//
//  Created by Ahmed Hamam on 06/12/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imagePath: String, placeholderImage: UIImage? = nil) {
        let imageURL = URL(string: imagePath)
        self.kf.setImage(with: imageURL, placeholder: placeholderImage, options: [.transition(.fade(0.5))] )
    }
    func makeCircular(){
           self.layer.cornerRadius = self.frame.width/2
    }
}
