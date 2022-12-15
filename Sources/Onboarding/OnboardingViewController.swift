//
//  OnboardingViewController.swift
//  
//
//  Created by Somica on 28/09/2022.
//

import UIKit

/// View Controller shown for onboarding users
public class OnboardingViewController: UIViewController {
    
    internal lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isDirectionalLockEnabled = true
        view.delegate = self
        return view
    }()
    
    internal var bulletList: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 27.5
        return stackView
    }()
    
    internal var headerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 13.5
        return stackView
    }()
    
    internal var buttonTray: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6.5
        return stackView
    }()
    
    internal var imageView: UIImageView?
    internal var descriptionLabel: UILabel?
    
    private var image: UIImage?
    private var symbolName: String?
    private var descriptionText: String?
    private var headerTitle: String?
    
    /// Initialize an onboarding view controller using an SF Symbol
    /// - Parameters:
    ///   - title: Title of the view controller
    ///   - description: Description of the view controller
    ///   - symbolName: Name of the symbol
    /// - Note:
    /// Any omitted fields will not show in the view controller
    @available(iOS 13, *)
    public init(title: String? = nil, description: String? = nil, symbolName: String? = nil) {
        self.symbolName = symbolName
        self.headerTitle = title
        self.descriptionText = description
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Initialize an onboarding view controller using a `UIImage`
    /// - Parameters:
    ///   - title: Title of the view controller
    ///   - description: Description of the view controller
    ///   - image: `UIImage` of view controller. Note: Will be scaled to 90x90
    /// - Note:
    /// Any omitted fields will not show in the view controller
    public init(title: String? = nil, description: String? = nil, image: UIImage? = nil) {
        self.image = image
        self.descriptionText = description
        self.headerTitle = title
        super.init(nibName: nil, bundle: nil)
    }
 
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var relativeTopAnchor = view.safeAreaLayoutGuide.topAnchor
    private lazy var relativeBottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
    
    private func scaled(_ num: Double) -> Double {
        let scale = UIScreen.main.nativeScale
        return scale * num
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        view.addSubview(headerView)
        view.addSubview(buttonTray)
        view.backgroundColor = .backgroundColor
        
        scrollView.addSubview(bulletList)
        var constraints = [NSLayoutConstraint]()
        
        var headerImageView: OnboardingImageView?
        if let image = self.image {
            headerImageView = .init(image: image, type: .header)
        } else if let symbolName = self.symbolName {
            if #available(iOS 13, *) {
                headerImageView = .init(symbolName: symbolName, type: .header)
            }
        }
        if let headerImageView = headerImageView {
            headerView.addArrangedSubview(headerImageView)
        }
        
        if let title = self.headerTitle {
            let label = UILabel(frame: .zero)
            label.text = title
            label.numberOfLines = 1
            label.textAlignment = .center
            label.textColor = .labelColor
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
            headerView.addArrangedSubview(label)
            constraints.append(label.heightAnchor.constraint(equalToConstant: 40))
        }

        if let description = self.descriptionText {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 17)
            label.text = description
            label.numberOfLines = 0
            label.textColor = .labelColor
            label.textAlignment = .center
            headerView.addArrangedSubview(label)
        }
        
        relativeTopAnchor = headerView.bottomAnchor
        constraints += [
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: headerView.topAnchor, constant: scaled(-25.8)),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: -25),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 25),
            
            scrollView.topAnchor.constraint(equalTo: relativeTopAnchor, constant: scaled(19.2)),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: scaled(18.3)),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: scaled(-18.3)),
            
            buttonTray.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 15),
            buttonTray.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: scaled(14.3)),
            buttonTray.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: scaled(-14.3)),
            buttonTray.bottomAnchor.constraint(equalTo: relativeBottomAnchor, constant: scaled(-11)),

            bulletList.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            bulletList.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            bulletList.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            bulletList.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: bulletList.widthAnchor)
        ]
        relativeBottomAnchor = scrollView.bottomAnchor
        NSLayoutConstraint.activate(constraints)
    }
    
    /// Add a bulletin to the list
    /// - Parameter bulletin: Bulletin to be added
    public func addBulletin(_ bulletin: OnboardingBulletinView) {
        bulletList.addArrangedSubview(bulletin)
    }
    
    /// Add a button to the tray
    /// - Parameter button: Button to be added
    public func addButton(_ button: OnboardingButton) {
        buttonTray.addArrangedSubview(button)
    }
    
    /// Add a loading indicator to the bulletin list
    public func addLoadingIndicator() {
        let loadingIndicator: UIActivityIndicatorView
        if #available(iOS 13, *) {
            loadingIndicator = UIActivityIndicatorView(style: .large)
        } else {
            loadingIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        loadingIndicator.startAnimating()
        bulletList.addArrangedSubview(loadingIndicator)
    }
    
}

extension OnboardingViewController: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.x != 0){
            scrollView.setContentOffset(CGPointMake(0, scrollView.contentOffset.y), animated: false)
        }
    }
    
}
