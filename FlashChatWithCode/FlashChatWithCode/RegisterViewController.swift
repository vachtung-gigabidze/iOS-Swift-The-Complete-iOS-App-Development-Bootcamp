//
//  RegisterViewController.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 18.10.2024.
//

import UIKit
import SwiftUI
import SnapKit

class RegisterViewController: UIViewController {
    
    // MARK: - UI
   
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setView()
        setConstraints()
    }
    
    // MARK: - Set Views
    private func setView(){
        view.backgroundColor = .systemTeal
        
        
    }
    
    // MARK: - Action
    
    @objc private func buttonsTapped(_ sender: UIButton){
        
    }
}

extension RegisterViewController {
    
    private func setConstraints() {
        
    }
}


//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        RegisterViewController().showPreview()
//    }
//}
