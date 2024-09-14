//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        imageView.image = ballArray.randomElement()
    }
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball5")]



}

