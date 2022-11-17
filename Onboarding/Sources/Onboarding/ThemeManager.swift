//
//  ThemeManager.swift
//  Shimmer
//
//  Created by Amy While on 20/07/2022.
//

import UIKit

internal final class ThemeManager {
   
    static let secondaryBackgroundColour: UIColor = {
        if #available(iOS 13, *) {
            return UIColor(dynamicProvider: { traitCollection in
                if traitCollection.userInterfaceStyle == .dark {
                    return .systemGray6
                } else {
                    return .white
                }
            })
        }
        return .white
    }()
    
    static let backgroundColour: UIColor = {
        if #available(iOS 13, *) {
            return .systemBackground
        }
        return .white
    }()
    
    static let secondaryLabel: UIColor = {
        UIColor(red: 0.56, green: 0.56, blue: 0.58, alpha: 1)
    }()
    
    static let label: UIColor = {
        if #available(iOS 13, *) {
            return .label
        }
        return .black
    }()
}

internal extension UIColor {

    static var backgroundColor: UIColor {
        ThemeManager.backgroundColour
    }
    
    static var secondaryBackgroundColor: UIColor {
        ThemeManager.secondaryBackgroundColour
    }
    
    static var secondaryLabelColor: UIColor {
        ThemeManager.secondaryLabel
    }
    
    static var labelColor: UIColor {
        ThemeManager.label
    }
    
}
