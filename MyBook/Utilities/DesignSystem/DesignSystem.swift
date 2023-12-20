//
//  DesignSystem.swift
//  DesignSystemExample
//
//  Created by Ahmed Hamam on 06/12/2023.
//

import Foundation
import UIKit

struct DesignSystem {
    
    
enum AppTypography {
    case title
    case body
    case button
    
    var font: UIFont {
        switch self {
        case .title:
           return UIFont.systemFont(ofSize: 30, weight: .bold)
        case .body:
            return UIFont.systemFont(ofSize: 16, weight: .regular)
        case .button:
            return UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
    }
}

// MARK: - Colors

enum AppColors {
    case title
    case primary
    case secondary
    case background
    case border
    case label
    
    var color: UIColor {
        switch self {
        case .title:
            return UIColor(red: 71/255, green: 26/255, blue: 160/255, alpha: 1.0)
        case .primary:
            return UIColor(red: 139/255, green: 136/255, blue: 123/255, alpha: 1.0)
        case .secondary:
            return UIColor.systemGray6
        case .background:
            return UIColor(red: 159/255, green: 186/255, blue: 185/255, alpha: 1.0)
        case .border:
            return UIColor(red: 65/255, green: 83/255, blue: 98/255, alpha: 1.0)
        case .label:
            return UIColor.white
        }
    }
}

// MARK: - Buttons

enum AppButtonStyle {
    case primary
    case secondary
    case label
    
    func apply(to button: UIButton, title: String) {
        switch self {
        case .primary:
            button.setTitleColor(.label, for: .normal)
            button.backgroundColor = AppColors.primary.color
            button.layer.cornerRadius = 8.0
            button.setTitle(title, for: .normal)
        case .secondary:
            button.setTitleColor(AppColors.primary.color, for: .normal)
            button.backgroundColor = .clear
            button.layer.cornerRadius = 8.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = AppColors.primary.color.cgColor
            button.setTitle(title, for: .normal)
        case.label:
            button.setTitleColor(AppColors.label.color, for: .normal)
            button.layer.cornerRadius = 8.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = AppColors.primary.color.cgColor
            button.setTitle(title, for: .normal)
        }
        
        button.titleLabel?.font = AppTypography.button.font
    }
}
    
}
