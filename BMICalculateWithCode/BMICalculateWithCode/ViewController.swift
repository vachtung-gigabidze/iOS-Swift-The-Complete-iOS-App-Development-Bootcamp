//
//  ViewController.swift
//  BMICalculateWithCode
//
//  Created by Дмирий Зядик on 18.09.2024.
//

import UIKit
import SwiftUI

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
    private let heightSlider = UISlider(maxValue: 3)
    private let weightSlider = UISlider(maxValue: 300)
    
    private var weightStackView = UIStackView()
    private var weightTitleLabel = UILabel(text: "", textAlignment: .left)
    private var weightNumberLabel = UILabel(text: "", textAlignment: .right)
    
    private lazy var calculateButton : UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .white
        element.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 1.0)
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .systemFont(ofSize: 20)
        element.setTitle("Calculate", for: .normal)
        element.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

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

    @objc private func calculateButtonTapped(){
        
    }

}

extension ViewController {
    private func setView(){
        heightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [heightTitleLabel, heightNumberLabel])
        weightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [weightTitleLabel, weightNumberLabel])
        
        
        mainStackView = UIStackView.init(axis: .vertical, distribution: .fillProportionally, subViews: [titleLabel, heightStackView, heightSlider, weightStackView, weightSlider, calculateButton])
        titleLabel.text = "CALCULATE YOUR BMI"
        heightTitleLabel.text = "Height"
        heightNumberLabel.text = "1.5 m"
        weightTitleLabel.text = "Weight"
        weightNumberLabel.text = "100 kg"
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
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        
        heightStackView.heightAnchor.constraint(equalToConstant: 21),
        heightSlider.heightAnchor.constraint(equalToConstant: 60),
        
        weightStackView.heightAnchor.constraint(equalToConstant: 21),
        weightSlider.heightAnchor.constraint(equalToConstant: 60),
        
        calculateButton.heightAnchor.constraint(equalToConstant: 51)
        
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

extension UISlider {
    convenience init(maxValue: Float){
        self.init()
        
        self.maximumValue = maxValue
        self.value = maxValue / 2
        self.thumbTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.minimumTrackTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}
