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
    
    /**
     Defines the alert content.
     - parameter title: The title of the alert.
     - parameter description: Optional, the subtitle presented on the alert.
     - parameter image: Optional, the image presented on the alert - Size: (50x50).
     */
    public init(title: String, description: String?, image: UIImage?) {
        self.title = title
        if description != nil { self.description = description }
        if image != nil { self.image = image }
    }
    
    /**
     Presents the alert.
     - parameter View: The view to be added.
     - parameter duration: The duration of the presentation.
     - parameter bounce: Optional, Used to enable or not the bounce effect.
     */
    public func presentNotchy(in View: UIView, duration: TimeInterval, bounce: Bool? = true) {
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
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    UIView.animate(withDuration: 0.3, animations: {
                        titleLabel.layer.position.y = 50
                        notchy.layer.position.y = 0
                    }) { (success) in
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 45
                            notchy.layer.position.y = -5
                        })  { (success) in
                            UIView.animate(withDuration: 0.2, animations: {
                                titleLabel.layer.position.y = 50
                                notchy.layer.position.y = 0
                            })
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 55
                            notchy.layer.position.y = 5
                        }, completion: { (success) in
                            UIView.animate(withDuration: 0.3, animations: {
                                titleLabel.layer.position.y = -145
                                notchy.layer.position.y = -145
                                titleLabel.removeFromSuperview()
                                notchy.removeFromSuperview()
                            })
                        })
                    }
                } else {
                    UIView.animate(withDuration: 0.3, animations: {
                        titleLabel.layer.position.y = 50
                        notchy.layer.position.y = 0
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.3, animations: {
                            titleLabel.layer.position.y = -145
                            notchy.layer.position.y = -145
                            titleLabel.removeFromSuperview()
                            notchy.removeFromSuperview()
                        })
                    }
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
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    UIView.animate(withDuration: 0.3, animations: {
                        titleLabel.layer.position.y = 50
                        descriptionLabel.layer.position.y = 70
                        notchy.layer.position.y = 0
                    }) { (success) in
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 45
                            descriptionLabel.layer.position.y = 65
                            notchy.layer.position.y = -5
                        })  { (success) in
                            UIView.animate(withDuration: 0.2, animations: {
                                titleLabel.layer.position.y = 50
                                descriptionLabel.layer.position.y = 70
                                notchy.layer.position.y = 0
                            })
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 55
                            descriptionLabel.layer.position.y = 75
                            notchy.layer.position.y = 5
                        }, completion: { (success) in
                            UIView.animate(withDuration: 0.3, animations: {
                                titleLabel.layer.position.y = -145
                                notchy.layer.position.y = -145
                                descriptionLabel.layer.position.y = -145
                                titleLabel.removeFromSuperview()
                                notchy.removeFromSuperview()
                            })
                        })
                    }
                } else {
                    UIView.animate(withDuration: 0.3, animations: {
                        titleLabel.layer.position.y = 50
                        descriptionLabel.layer.position.y = 70
                        notchy.layer.position.y = 0
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.3, animations: {
                            titleLabel.layer.position.y = -145
                            notchy.layer.position.y = -145
                            descriptionLabel.layer.position.y = -145
                            titleLabel.removeFromSuperview()
                            notchy.removeFromSuperview()
                        })
                    }
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
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    UIView.animate(withDuration: 0.3, animations: {
                        notchy.layer.position.y = 0
                        titleLabel.layer.position.y = 50
                        imageView.layer.position.y = 95
                    }) { (success) in
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 45
                            imageView.layer.position.y = 90
                            notchy.layer.position.y = -5
                        })  { (success) in
                            UIView.animate(withDuration: 0.2, animations: {
                                titleLabel.layer.position.y = 50
                                imageView.layer.position.y = 95
                                notchy.layer.position.y = 0
                            })
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 55
                            notchy.layer.position.y = 5
                            imageView.layer.position.y = 100
                        }, completion: { (success) in
                            UIView.animate(withDuration: 0.3, animations: {
                                titleLabel.layer.position.y = -145
                                imageView.layer.position.y = -145
                                notchy.layer.position.y = -145
                                titleLabel.removeFromSuperview()
                                notchy.removeFromSuperview()
                                imageView.removeFromSuperview()
                            })
                        })
                    }
                } else {
                    UIView.animate(withDuration: 0.3, animations: {
                        titleLabel.layer.position.y = 50
                        imageView.layer.position.y = 95
                        notchy.layer.position.y = 0
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.3, animations: {
                            titleLabel.layer.position.y = -145
                            imageView.layer.position.y = -145
                            notchy.layer.position.y = -145
                            titleLabel.removeFromSuperview()
                            notchy.removeFromSuperview()
                            imageView.removeFromSuperview()
                        })
                    }
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
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    UIView.animate(withDuration: 0.3, animations: {
                        notchy.layer.position.y = 0
                        titleLabel.layer.position.y = 50
                        descriptionLabel.layer.position.y = 70
                        imageView.layer.position.y = 113
                    }) { (success) in
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 45
                            imageView.layer.position.y = 108
                            descriptionLabel.layer.position.y = 65
                            notchy.layer.position.y = -5
                        })  { (success) in
                            UIView.animate(withDuration: 0.2, animations: {
                                titleLabel.layer.position.y = 50
                                imageView.layer.position.y = 113
                                descriptionLabel.layer.position.y = 70
                                notchy.layer.position.y = 0
                            })
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.2, animations: {
                            titleLabel.layer.position.y = 55
                            imageView.layer.position.y = 118
                            descriptionLabel.layer.position.y = 75
                            notchy.layer.position.y = 5
                        }, completion: { (success) in
                            UIView.animate(withDuration: 0.3, animations: {
                                titleLabel.layer.position.y = -145
                                descriptionLabel.layer.position.y = -145
                                imageView.layer.position.y = -145
                                notchy.layer.position.y = -145
                                titleLabel.removeFromSuperview()
                                notchy.removeFromSuperview()
                                imageView.removeFromSuperview()
                            })
                        })
                    }
                } else {
                    UIView.animate(withDuration: 0.3, animations: {
                        titleLabel.layer.position.y = 50
                        imageView.layer.position.y = 113
                        descriptionLabel.layer.position.y = 70
                        notchy.layer.position.y = 0
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        UIView.animate(withDuration: 0.3, animations: {
                            titleLabel.layer.position.y = -145
                            descriptionLabel.layer.position.y = -145
                            imageView.layer.position.y = -145
                            notchy.layer.position.y = -145
                            titleLabel.removeFromSuperview()
                            notchy.removeFromSuperview()
                            imageView.removeFromSuperview()
                        })
                    }
                }
            }
        } else {
            print("Notchy only works with the iPhone X !")
        }
    }
    
    /**
     Generate an haptic feedback (available on iOS 10.0 and later)
     
     - parameter force: the intensity of the haptic feedback
     */
    public func feedbackGenerator(force: UIImpactFeedbackStyle) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: force)
            generator.impactOccurred()
        }
    }
}
