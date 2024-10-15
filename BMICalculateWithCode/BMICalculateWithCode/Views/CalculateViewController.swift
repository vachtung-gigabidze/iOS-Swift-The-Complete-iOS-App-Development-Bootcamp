//
//  ViewController.swift
//  BMICalculateWithCode
//
//  Created by Дмирий Зядик on 18.09.2024.
//

import UIKit
import SwiftUI

class CalculateViewController: UIViewController {

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
    
    private lazy var calculateButton = UIButton(isBackgroundWhite: false)

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
    
    var calculateBrain = CalculateBrain()
    
    @objc private func heightSliderChanged(_ sender: UISlider){
        heightNumberLabel.text = String(format: "%.2f m", sender.value)
    }
    
    @objc private func weightSliderChanged(_ sender: UISlider){
        weightNumberLabel.text = String(format: "%.0f Kg", sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupConstrains()
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        heightSlider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
    }

    @objc private func calculateButtonTapped(){
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculateBrain.calculateBMI(height: height, weight: weight)
        
        let resultVC = ResultViewController()
        resultVC.bmiValue = calculateBrain.printBMI()
        resultVC.color = calculateBrain.getColor()
        resultVC.advice = calculateBrain.getAdvice()
        
        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.modalPresentationStyle = .fullScreen
        
        present(resultVC, animated: true)
    }

}

extension CalculateViewController {
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


//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        CalculateViewController().showPreview()
//    }
//}
