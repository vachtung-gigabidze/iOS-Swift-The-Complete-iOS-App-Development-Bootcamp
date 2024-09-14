//
//  ViewController.swift
//  DiceWithCode
//
//  Created by Дмирий Зядик on 13.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GreenBackground")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }


}

