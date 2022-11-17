//
//  OnboardingButton.swift
//  
//
//  Created by Amy While on 17/11/2022.
//

import UIKit

/// A button that is added to the bottom of an `OnboardingViewController`
public class OnboardingButton: UIButton {
    
    private let type: OnboardingButtonType
    private let title: String
    
    /// Initialize a button
    /// - Parameters:
    ///   - type: The type of button to create, refer to `OnboardingButtonType`
    ///   - title: The title for the button
    public init(type: OnboardingButtonType, title: String) {
        self.type = type
        self.title = title
        super.init(frame: .zero)
        _init()
    }
   
    private func _init() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        layer.cornerRadius = 7.5
        switch type {
        case .clear(textColor: let textColor):
            setTitleColor(textColor, for: .normal)
        case .filled(color: let color):
            setTitleColor(.white, for: .normal)
            backgroundColor = color
        }
        
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 15.5, weight: .regular)
        
        let height: Double
        switch Int(UIScreen.main.scale) {
        case 1, 2: height = 40
        default: height = 45
        }
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
