//
//  ViewController.swift
//  EggTimerWithCode
//
//  Created by Дмирий Зядик on 17.09.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var mainStackView: UIStackView = {
        let element =  UIStackView()
        element.backgroundColor = .systemCyan
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue()
        setupContraints()
    }
}

// MARK - Extension

extension ViewController {
    private func setValue() {
        <#code#>
    }
    
    private func setupContraints() {
        <#code#>
    }
}
