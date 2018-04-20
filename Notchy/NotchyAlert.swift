//
//  File.swift
//  NotchyAlert
//
//  Created by Sofiane Beors on 20/04/2018.
//  Copyright © 2018 Sofiane Beors. All rights reserved.
//

import Foundation
import UIKit

public class NotchyAlert {
    var title: String = ""
    var description: String?
    var image: UIImage?
    
    public init(title: String, description: String?, image: UIImage?) {
        self.title = title
        if description != nil { self.description = description }
        if image != nil { self.image = image }
    }
    
    public func presentNotchy(in View: UIView, duration: TimeInterval) {
        if UIDevice().userInterfaceIdiom == .phone && UIScreen.main.nativeBounds.height == 2436 {
            let notchy = UIView(frame: CGRect.zero)
            notchy.backgroundColor = .black
            notchy.layer.cornerRadius = 12
            
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            titleLabel.textAlignment = .center
            titleLabel.text = self.title
            titleLabel.textColor = .white
            titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            titleLabel.sizeToFit()
            
            let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            descriptionLabel.textAlignment = .center
            
            if description == nil && image == nil {
                notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 147)
                titleLabel.center = notchy.center
                View.addSubview(notchy)
                View.addSubview(titleLabel)
                
                UIView.animate(withDuration: 0.3) {
                    titleLabel.layer.position.y = 50
                    notchy.layer.position.y = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    titleLabel.layer.position.y = -145
                    notchy.layer.position.y = -145
                    titleLabel.removeFromSuperview()
                    notchy.removeFromSuperview()
                }
            }
            
            if description != nil && image == nil {
                notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 175)
                titleLabel.center = notchy.center
                View.addSubview(notchy)
                View.addSubview(titleLabel)
                
                descriptionLabel.text = self.description
                descriptionLabel.sizeToFit()
                descriptionLabel.textColor = .white
                descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
                descriptionLabel.center = notchy.center
                View.addSubview(descriptionLabel)
                
                UIView.animate(withDuration: 0.3) {
                    titleLabel.layer.position.y = 50
                    descriptionLabel.layer.position.y = 70
                    notchy.layer.position.y = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    titleLabel.layer.position.y = -145
                    notchy.layer.position.y = -145
                    descriptionLabel.layer.position.y = -145
                    titleLabel.removeFromSuperview()
                    notchy.removeFromSuperview()
                }
            }
            
            if description == nil && image != nil {
                notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 275)
                titleLabel.center = notchy.center
                View.addSubview(notchy)
                View.addSubview(titleLabel)
                
                let imageView = UIImageView(image: self.image)
                imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                imageView.center = notchy.center
                View.addSubview(imageView)
                
                UIView.animate(withDuration: 0.3) {
                    titleLabel.layer.position.y = 50
                    notchy.layer.position.y = 0
                    imageView.layer.position.y = 95
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    titleLabel.layer.position.y = -145
                    notchy.layer.position.y = -145
                    titleLabel.removeFromSuperview()
                    imageView.layer.position.y = -145
                    imageView.removeFromSuperview()
                    notchy.removeFromSuperview()
                }
            }
            
            if description != nil && image != nil {
                notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 300)
                titleLabel.center = notchy.center
                View.addSubview(notchy)
                View.addSubview(titleLabel)
                
                descriptionLabel.text = self.description
                descriptionLabel.layer.position.y = -145
                descriptionLabel.sizeToFit()
                descriptionLabel.textColor = .white
                descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
                descriptionLabel.center = notchy.center
                View.addSubview(descriptionLabel)
                
                let imageView = UIImageView(image: self.image)
                imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                imageView.center = notchy.center
                View.addSubview(imageView)
                
                UIView.animate(withDuration: 0.3) {
                    titleLabel.layer.position.y = 50
                    descriptionLabel.layer.position.y = 70
                    notchy.layer.position.y = 0
                    imageView.layer.position.y = 113
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    titleLabel.layer.position.y = -145
                    notchy.layer.position.y = -145
                    descriptionLabel.layer.position.y = -145
                    titleLabel.removeFromSuperview()
                    descriptionLabel.removeFromSuperview()
                    imageView.layer.position.y = -145
                    imageView.removeFromSuperview()
                    notchy.removeFromSuperview()
                }
            }
        } else {
            print("Notchy only works with the iPhone X !")
        }
    }
}
