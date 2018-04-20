//
//  ViewController.swift
//  Notchy
//
//  Created by Sofiane Beors on 20/04/2018.
//  Copyright © 2018 Sofiane Beors. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAction(_ sender: Any) {
        let notchy = NotchyAlert(title: "Oops!", description: "No internet Connection.", image: #imageLiteral(resourceName: "nocell"))
        notchy.presentNotchy(in: self.view, duration: 3)
    }
    
}

