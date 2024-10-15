//
//  ResultViewController.swift
//  BMICalculateWithCode
//
//  Created by Дмирий Зядик on 15.10.2024.
//

import UIKit
import SwiftUI

class ResultViewController: UIViewController {
    
    
    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "result_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    private lazy var calculateButton = UIButton(isBackgroundWhite: true)
    
    private lazy var titleLabel : UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 35, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()   
    private lazy var resultLabel : UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 80, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }() 
    private lazy var descriptionLabel : UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 20, weight: .light)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Public parameters
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        resultLabel.text = bmiValue
        descriptionLabel.text = advice
        view.backgroundColor = color ?? .blue
        
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        setView()
        setupConstrains()
    }
    
    @objc private func calculateButtonTapped(){
        dismiss(animated: true)
    }
}

extension ResultViewController {
    private func setView(){
        
        
        mainStackView = UIStackView.init(axis: .vertical, distribution: .fillProportionally, subViews: [titleLabel, resultLabel, descriptionLabel])
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        view.addSubview(calculateButton)
        titleLabel.text = "YOUR RESULT"
        resultLabel.text = "19.5"
        descriptionLabel.text = "EAT SOME MORE SNACK"
        
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        
        calculateButton.heightAnchor.constraint(equalToConstant: 51),
        calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        calculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        calculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}




//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        ResultViewController().showPreview()
//    }
//}
