//
//  OnboardingImageView.swift
//  
//
//  Created by Somica on 28/09/2022.
//

import UIKit

internal enum ImageType {
    case header
    case bulletItem
}

internal class OnboardingImageView: UIImageView {
    
    @available(iOS 13, *)
    internal convenience init(symbolName: String, type: ImageType) {
        var symbolConfig: UIImage.SymbolConfiguration?
        if type == .header {
            symbolConfig = UIImage.SymbolConfiguration(pointSize: 46, weight: .regular)
        }
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfig)
        self.init(image: image, type: type)
    }
    
    internal init(image: UIImage?, type: ImageType) {
        super.init(frame: .zero)
        self.image = image
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .header:
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: 90),
                widthAnchor.constraint(equalToConstant: 90)
            ])
            contentMode = .scaleAspectFit
            layer.masksToBounds = true
            layer.cornerRadius = 11.25
        case .bulletItem:
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: 40),
                heightAnchor.constraint(equalToConstant: 43)
            ])
            contentMode = .scaleAspectFit
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
