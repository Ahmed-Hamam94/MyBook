//
//  String+Extension.swift
//  DesignSystemExample
//
//  Created by Ahmed Hamam on 06/12/2023.
//

import Foundation

extension String {
    
    var asURL: URL? {
        return URL(string: self)
    }
    
    func encodeUrl() -> String {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""
    }
}
