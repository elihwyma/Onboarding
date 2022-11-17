//
//  OnboardingBulletinView.swift
//  
//
//  Created by Somica on 29/09/2022.
//

import UIKit

/// A view which is added to the bulletin list in an `OnboardingViewController`
public class OnboardingBulletinView: UIView {
    
    private var imageView: OnboardingImageView
    
    /// Initialize a bulletin using an SF Symbol
    /// - Parameters:
    ///   - title: Title of bulletin
    ///   - description: Description of bulletin
    ///   - symbol: SF Symbol of bulletin
    @available(iOS 13, *)
    public init(title: String, description: String, symbol: String) {
        self.imageView = OnboardingImageView(symbolName: symbol, type: .bulletItem)
        
        super.init(frame: .zero)
        self.commonInit(title: title, description: description)
    }
    
    /// Initialize a bulletin using a `UIImage`
    /// - Parameters:
    ///   - title: Title of bulletin
    ///   - description: Description of bulletin
    ///   - image: `UIImage` of bulletin. Note, this will be scaled to 43x40
    public init(title: String, description: String, image: UIImage) {
        self.imageView = OnboardingImageView(image: image, type: .bulletItem)
        
        super.init(frame: .zero)
        self.commonInit(title: title, description: description)
    }
    
    private func commonInit(title: String, description: String) {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 15
        
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textColor = .labelColor
        
        let descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = description
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = .secondaryLabelColor
        
        let textStackView = UIStackView(frame: .zero)
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.axis = .vertical
        textStackView.distribution = .fillProportionally
        textStackView.spacing = 0
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
 
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textStackView)

        addSubview(stackView)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            topAnchor.constraint(equalTo: stackView.topAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
    }
    
    required public init?(coder: NSCoder) {
        fatalError("Init with coder is not supported :woeisme:")
    }
    
}
