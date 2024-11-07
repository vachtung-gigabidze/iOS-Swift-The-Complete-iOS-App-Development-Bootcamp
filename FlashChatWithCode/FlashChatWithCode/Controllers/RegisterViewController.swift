//
//  RegisterViewController.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 18.10.2024.
//

import UIKit
import SwiftUI
import SnapKit

enum AuthorizationType: String {
    case register = "Register"
    case login = "Log in"
}

class RegisterViewController: UIViewController {
    
    // MARK: - UI
    private let mainStackView = UIStackView(axis: .vertical, distribution:.fill,  alignment: .fill, spacing: 8, subViews: [])
    let emailTextField = UITextField(placeholder: K.emailName, color: UIColor(named: K.BrandColors.blue))
    let passwordTextField = UITextField(placeholder: K.passwordName, color: .black)
    
    private lazy var imageView : UIImageView = {
        let element = UIImageView()
        element.isUserInteractionEnabled = true
        element.image = UIImage(named: K.textfieldImageName)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let registerButton = UIButton(titleColor: UIColor(named: K.BrandColors.blue))
    
    // MARK: - Public Properties
    
    public var authorizationType: AuthorizationType?
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorizationType = .login
        setView()
        setConstraints()
    }
    
    // MARK: - Set Views
    private func setView(){
        
        switch authorizationType {
        case .register :
            view.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
            registerButton.setTitle(K.registerName, for: .normal)
        case .login :
            view.backgroundColor = UIColor(named: K.BrandColors.blue)
            registerButton.setTitle(K.logInName, for: .normal)
            registerButton.setTiEtleColor(.white, for: .normal)
            
            emailTextField.text = "user@mail.ru"
        default: break
        }
        
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(registerButton)
        imageView.addSubview(passwordTextField)
        view.addSubview(mainStackView)
        
        emailTextField.makeShadow()
        passwordTextField.isSecureTextEntry = true
        
        registerButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        
    }
    
    // MARK: - Action
    
    @objc private func buttonsTapped(_ sender: UIButton){
        if sender.currentTitle == K.logInName {
            let nextVC = ChatViewController()
            navigationController?.pushViewController(nextVC, animated: true)
        } else {
            print("register view")
        }
        
    }
}

extension RegisterViewController {
    
    private func setConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(K.Size.textFieldHeight)
            make.leading.trailing.equalTo(view).inset(K.Size.textFieldInset)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(137)
            make.leading.trailing.equalTo(view)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-62)
            make.height.equalTo(45)
            make.leading.trailing.equalTo(view).inset(48)
        }
    }
}




