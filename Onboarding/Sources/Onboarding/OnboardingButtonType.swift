//
//  OnboardingButtonType.swift
//  
//
//  Created by Amy While on 17/11/2022.
//

import UIKit

/// Available types for `OnboardingButton`
public enum OnboardingButtonType {
    /// A button that is filled with a solid color. Text color will always be white.
    /// - Parameters:
    ///  - color: Fill color of the button. Typically this should be the tint color of the view
    case filled(color: UIColor)
    /// A button that is transparent. This should typically be used as the cancel option
    /// - Parameters:
    ///  - textColor: Text color of the title. Typically this should be the tint color of the view
    case clear(textColor: UIColor)
}
