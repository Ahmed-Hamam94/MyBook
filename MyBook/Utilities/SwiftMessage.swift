//
//  SwiftMessage.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import Foundation
import UIKit
import SwiftMessages


final class SwiftMessage {
        func swiftMessage(title: String, body: String, color: Theme, layout: MessageView.Layout, style: SwiftMessages.PresentationStyle) {
            let view = MessageView.viewFromNib(layout: layout)
            view.configureTheme(color)
            view.configureDropShadow()
            view.configureContent(title: title, body: body)
            view.button?.isHidden = true
            var config = SwiftMessages.defaultConfig
            config.presentationStyle = style
            config.dimMode = .gray(interactive: true)
            config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
           // config.duration = .forever
            SwiftMessages.show(config: config, view: view)
        }
    
    
}
