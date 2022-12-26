//
//  ViewController.swift
//  AnimateButtonBounce
//
//  Created by Salman Biljeek on 12/26/22.
//

import UIKit

class ViewController: UIViewController {
     
    var didLike: Bool = false {
        didSet {
            let likeImageForNormal = didLike ? likeIconFilled : likeIcon
            let likeImageForHighlighted = didLike ? likeIcon : likeIconFilled
            likeButton.setImage(likeImageForNormal, for: .normal)
            likeButton.setImage(likeImageForHighlighted, for: .highlighted)
        }
    }
    
    let controlsImagePointSize: CGFloat = 60
    lazy var imageConfig: UIImage.Configuration = UIImage.SymbolConfiguration(pointSize: self.controlsImagePointSize, weight: .bold, scale: .large)
    lazy var likeIcon = UIImage(systemName: "heart")?.withRenderingMode(.alwaysOriginal).withTintColor(.label).withConfiguration(imageConfig) ?? UIImage()
    lazy var likeIconFilled = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemRed).withConfiguration(imageConfig) ?? UIImage()
    
    lazy var likeButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = .zero
        configuration.image = self.likeIcon
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.addTarget(self, action: #selector(self.animateButton), for: .touchUpInside)
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        likeButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc fileprivate func animateButton(button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = button.transform.scaledBy(x: 0.75, y: 0.75)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                button.transform = CGAffineTransform.identity
            })
        })
    }
    
    @objc fileprivate func didTapButton() {
        self.didLike = !self.didLike
    }
}

