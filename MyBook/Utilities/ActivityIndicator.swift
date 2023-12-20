//
//  ActivityIndicator.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import UIKit

final class ActivityIndicator{
   static let shared = ActivityIndicator()
    let indicator = UIActivityIndicatorView(style: .large)

    private init(){
    
    }
    func setUpIndicator(view: UIView){
        indicator.center = view.center
       view.addSubview(indicator)
       indicator.startAnimating()
   }
  
}
