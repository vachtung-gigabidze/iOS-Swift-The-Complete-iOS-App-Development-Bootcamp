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
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "GreenBackground")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let diceOneImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DiceOne")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView    }()
    
    let diceTwoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DiceTwo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView    }()
    
    lazy var rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 155/255, green: 28/255, blue: 32/255, alpha: 1)
        button.addTarget(self, action: #selector(rollButtonTapped), for: UIControl.Event.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let images: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), UIImage(named: "DiceSix")!]
    
    @objc func rollButtonTapped(){
        diceOneImageView.image = images.randomElement()
        diceTwoImageView.image = images.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        view.addSubview(diceOneImageView)
        diceOneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceOneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        diceOneImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        diceOneImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(diceTwoImageView)
        diceTwoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceTwoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        diceTwoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        diceTwoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
     
        view.addSubview(rollButton)
        rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120).isActive = true
        rollButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        rollButton.widthAnchor.constraint(equalToConstant: 100).isActive = true    }
}

