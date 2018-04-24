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
    private var notchy: UIView!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel?
    private var imageView: UIImageView?
    var duration: TimeInterval!
    
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
        self.duration = duration
        if UIDevice().userInterfaceIdiom == .phone && UIScreen.main.nativeBounds.height == 2436 {
            self.notchy = UIView(frame: CGRect.zero)
            self.notchy.backgroundColor = .black
            self.notchy.layer.cornerRadius = 12
            
            self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            self.titleLabel.textAlignment = .center
            self.titleLabel.text = self.title
            self.titleLabel.textColor = .white
            self.titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            self.titleLabel.sizeToFit()
            
            self.descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            self.descriptionLabel?.textAlignment = .center
            
            if description == nil && image == nil {
                self.notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 147)
                self.titleLabel.center = self.notchy.center
                View.addSubview(self.notchy)
                View.addSubview(self.titleLabel)
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    self.animateWithBounceEffect(description: false, imageView: false)
                } else {
                    self.animate(description: false, imageView: false)
                }
            }
            if description != nil && image == nil {
                self.notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 175)
                self.titleLabel.center = self.notchy.center
                View.addSubview(self.notchy)
                View.addSubview(self.titleLabel)
                
                self.descriptionLabel?.text = self.description
                self.descriptionLabel?.sizeToFit()
                self.descriptionLabel?.textColor = .white
                self.descriptionLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
                self.descriptionLabel?.center = self.notchy.center
                View.addSubview(self.descriptionLabel!)
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    self.animateWithBounceEffect(description: true, imageView: false)
                } else {
                    self.animate(description: true, imageView: false)
                }
            }
            
            if description == nil && image != nil {
                self.notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 275)
                self.titleLabel.center = notchy.center
                View.addSubview(self.notchy)
                View.addSubview(self.titleLabel)
                
                self.imageView = UIImageView(image: self.image)
                self.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                self.imageView?.center = notchy.center
                View.addSubview(self.imageView!)
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    self.animateWithBounceEffect(description: false, imageView: true)
                } else {
                    self.animate(description: false, imageView: true)
                }
            }
            
            if description != nil && image != nil {
                self.notchy.frame = CGRect(x: 80, y: -145, width: 217, height: 300)
                self.titleLabel.center = notchy.center
                View.addSubview(self.notchy)
                View.addSubview(self.titleLabel)
                
                self.descriptionLabel?.text = self.description
                self.descriptionLabel?.layer.position.y = -145
                self.descriptionLabel?.sizeToFit()
                self.descriptionLabel?.textColor = .white
                self.descriptionLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
                self.descriptionLabel?.center = notchy.center
                View.addSubview(self.descriptionLabel!)
                
                self.imageView = UIImageView(image: self.image)
                self.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                self.imageView?.center = self.notchy.center
                View.addSubview(self.imageView!)
                feedbackGenerator(force: .light)
                
                if bounce != nil && bounce == true {
                    self.animateWithBounceEffect(description: true, imageView: true)
                } else {
                    self.animate(description: true, imageView: true)
                }
            }
        } else {
            print("Notchy only works with the iPhone X !")
        }
    }
    
    private func animateWithBounceEffect(description: Bool, imageView: Bool) {
        if description == false && imageView == false {
            UIView.animate(withDuration: 0.3, animations: {
                self.titleLabel.layer.position.y = 50
                self.notchy.layer.position.y = 0
            }) { (success) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 45
                    self.notchy.layer.position.y = -5
                })  { (success) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.titleLabel.layer.position.y = 50
                        self.notchy.layer.position.y = 0
                    })
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.duration) {
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 55
                    self.notchy.layer.position.y = 5
                }, completion: { (success) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.titleLabel.layer.position.y = -145
                        self.notchy.layer.position.y = -145
                        self.titleLabel.removeFromSuperview()
                        self.notchy.removeFromSuperview()
                    })
                })
            }
        } else if description == true && imageView == false {
            UIView.animate(withDuration: 0.3, animations: {
                self.titleLabel.layer.position.y = 50
                self.descriptionLabel?.layer.position.y = 70
                self.notchy.layer.position.y = 0
            }) { (success) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 45
                    self.descriptionLabel?.layer.position.y = 65
                    self.notchy.layer.position.y = -5
                })  { (success) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.titleLabel.layer.position.y = 50
                        self.descriptionLabel?.layer.position.y = 70
                        self.notchy.layer.position.y = 0
                    })
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 55
                    self.descriptionLabel?.layer.position.y = 75
                    self.notchy.layer.position.y = 5
                }, completion: { (success) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.titleLabel.layer.position.y = -145
                        self.notchy.layer.position.y = -145
                        self.descriptionLabel?.layer.position.y = -145
                        self.titleLabel.removeFromSuperview()
                        self.notchy.removeFromSuperview()
                    })
                })
            }
        } else if description == false && imageView == true {
            UIView.animate(withDuration: 0.3, animations: {
                self.notchy.layer.position.y = 0
                self.titleLabel.layer.position.y = 50
                self.imageView?.layer.position.y = 95
            }) { (success) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 45
                    self.imageView?.layer.position.y = 90
                    self.notchy.layer.position.y = -5
                })  { (success) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.titleLabel.layer.position.y = 50
                        self.imageView?.layer.position.y = 95
                        self.notchy.layer.position.y = 0
                    })
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 55
                    self.notchy.layer.position.y = 5
                    self.imageView?.layer.position.y = 100
                }, completion: { (success) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.titleLabel.layer.position.y = -145
                        self.imageView?.layer.position.y = -145
                        self.notchy.layer.position.y = -145
                        self.titleLabel.removeFromSuperview()
                        self.notchy.removeFromSuperview()
                        self.imageView?.removeFromSuperview()
                    })
                })
            }
            
        } else if description == true && imageView == true {
            UIView.animate(withDuration: 0.3, animations: {
                self.notchy.layer.position.y = 0
                self.titleLabel.layer.position.y = 50
                self.descriptionLabel?.layer.position.y = 70
                self.imageView?.layer.position.y = 113
            }) { (success) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 45
                    self.imageView?.layer.position.y = 108
                    self.descriptionLabel?.layer.position.y = 65
                    self.notchy.layer.position.y = -5
                })  { (success) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.titleLabel.layer.position.y = 50
                        self.imageView?.layer.position.y = 113
                        self.descriptionLabel?.layer.position.y = 70
                        self.notchy.layer.position.y = 0
                    })
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.layer.position.y = 55
                    self.imageView?.layer.position.y = 118
                    self.descriptionLabel?.layer.position.y = 75
                    self.notchy.layer.position.y = 5
                }, completion: { (success) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.titleLabel.layer.position.y = -145
                        self.descriptionLabel?.layer.position.y = -145
                        self.imageView?.layer.position.y = -145
                        self.notchy.layer.position.y = -145
                        self.titleLabel.removeFromSuperview()
                        self.notchy.removeFromSuperview()
                        self.imageView?.removeFromSuperview()
                    })
                })
            }
        }
    }
    
    private func animate(description: Bool, imageView: Bool) {
        if description == false && imageView == false {
            UIView.animate(withDuration: 0.3, animations: {
                self.titleLabel.layer.position.y = 50
                self.notchy.layer.position.y = 0
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.titleLabel.layer.position.y = -145
                    self.notchy.layer.position.y = -145
                    self.titleLabel.removeFromSuperview()
                    self.notchy.removeFromSuperview()
                })
            }
        } else if description == true && imageView == false {
            UIView.animate(withDuration: 0.3, animations: {
                self.titleLabel.layer.position.y = 50
                self.descriptionLabel?.layer.position.y = 70
                self.notchy.layer.position.y = 0
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.titleLabel.layer.position.y = -145
                    self.notchy.layer.position.y = -145
                    self.descriptionLabel?.layer.position.y = -145
                    self.titleLabel.removeFromSuperview()
                    self.notchy.removeFromSuperview()
                })
            }
        } else if description == false && imageView == true {
            UIView.animate(withDuration: 0.3, animations: {
                self.titleLabel.layer.position.y = 50
                self.imageView?.layer.position.y = 95
                self.notchy.layer.position.y = 0
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.titleLabel.layer.position.y = -145
                    self.imageView?.layer.position.y = -145
                    self.notchy.layer.position.y = -145
                    self.titleLabel.removeFromSuperview()
                    self.notchy.removeFromSuperview()
                    self.imageView?.removeFromSuperview()
                })
            }
        } else if description == true && imageView == true {
            UIView.animate(withDuration: 0.3, animations: {
                self.titleLabel.layer.position.y = 50
                self.imageView?.layer.position.y = 113
                self.descriptionLabel?.layer.position.y = 70
                self.notchy.layer.position.y = 0
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.titleLabel.layer.position.y = -145
                    self.descriptionLabel?.layer.position.y = -145
                    self.imageView?.layer.position.y = -145
                    self.notchy.layer.position.y = -145
                    self.titleLabel.removeFromSuperview()
                    self.notchy.removeFromSuperview()
                    self.imageView?.removeFromSuperview()
                })
            }
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
