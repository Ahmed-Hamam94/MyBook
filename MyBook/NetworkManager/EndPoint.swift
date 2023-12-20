//
//  EndPoint.swift
//  CleanMVC
//
//  Created by Ahmed Hamam on 26/11/2023.
//

import Foundation


enum EndPoint {
    static let baseUrl = "https://www.googleapis.com/"
    
    case books(query: String = "")
   
    

    var path: String{
        switch self{
        case .books:
            return "books/v1/volumes"
            
        }
    }
    
}
