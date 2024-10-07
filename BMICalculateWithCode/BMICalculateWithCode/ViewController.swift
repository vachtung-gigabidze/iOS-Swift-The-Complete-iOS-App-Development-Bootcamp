//
//  ViewController.swift
//  BMICalculateWithCode
//
//  Created by Дмирий Зядик on 18.09.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "calculate_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    private var heightStackView = UIStackView()
    private var heightTitleLabel = UILabel(text: "", textAlignment: .left)
    private var heightNumberLabel = UILabel(text: "", textAlignment: .right)
    
    private var weightStackView = UIStackView()
    private var weightTitleLabel = UILabel(text: "", textAlignment: .left)
    private var weightNumberLabel = UILabel(text: "", textAlignment: .right)

    private lazy var titleLabel : UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .darkGray
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupConstrains()
    }


}

extension ViewController {
    private func setView(){
        mainStackView = UIStackView.init(axis: .vertical, distribution: .fillProportionally, subViews: [titleLabel])
        titleLabel.text = "CALCULATE YOUR BMI"
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        ])
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subViews: [UIView] ) {
        self.init(arrangedSubviews: subViews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(text: String, textAlignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        self.font = .systemFont(ofSize: 17, weight: .light)
        self.textColor = .darkGray
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
