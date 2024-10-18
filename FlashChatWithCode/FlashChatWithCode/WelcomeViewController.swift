//
//  ViewController.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 18.10.2024.
//

import UIKit
import SwiftUI
import SnapKit

class WelcomeViewController: UIViewController {
    
    // MARK: - UI
    private lazy var titleLabel : UILabel = {
        let element = UILabel()
        element.textColor = UIColor(named: K.BrandColors.blue)
        element.font = .systemFont(ofSize: 50, weight: .black)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let registerButton = UIButton(titleColor: UIColor(named: K.BrandColors.blue), backgroundColor: UIColor(named: K.BrandColors.lighBlue))
    
    private let loginButton  = UIButton(titleColor: .white, backgroundColor: .systemTeal)
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setView()
        setConstraints()
    }
    
    // MARK: - Set Views
    private func setView(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
        
        titleLabel.text = K.appName
        registerButton.setTitle(K.registerName, for: .normal)
        loginButton.setTitle(K.logInName, for: .normal)
    }
    
    // MARK: - Action
    
    @objc private func buttonsTapped(_ sender: UIButton){
        let nextVC = RegisterViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension WelcomeViewController {
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(K.Size.buttonSize)
            make.leading.trailing.equalToSuperview()
        }
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(loginButton.snp.top).offset(-K.Size.buttonOffset)
            make.height.equalTo(K.Size.buttonSize)
            make.leading.trailing.equalToSuperview()
        }
    }
}


//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        WelcomeViewController().showPreview()
//    }
//}
