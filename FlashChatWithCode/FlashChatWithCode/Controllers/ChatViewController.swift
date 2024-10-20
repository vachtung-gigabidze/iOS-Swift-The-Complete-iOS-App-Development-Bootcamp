//
//  ChatViewController.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 19.10.2024.
//

import SwiftUI
import UIKit

class ChatViewController : UIViewController {
    
    // MARK: - UI
    private let tableView = UITableView()
    
    private lazy var messageTextField : UITextField = {
        let element = UITextField()
        element.backgroundColor = .white
        element.borderStyle = .roundedRect
        element.placeholder = K.enterMessagePlaceholder
        element.textColor = UIColor(named: K.BrandColors.purple)
        element.tintColor = UIColor(named: K.BrandColors.purple)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var containerView : UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: K.BrandColors.purple)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var enterButton : UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: K.enterButtonImageName), for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    var messages = Message.getMessagers()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setView()
        setConstraints()
       
    }
    
    // MARK: - Set View
    
    func setView(){
        view.backgroundColor = UIColor(named: K.BrandColors.purple)
        title = K.appName
        navigationController?.navigationBar.barTintColor = UIColor(named: K.BrandColors.lighBlue)
        
        tableView.backgroundColor = .white
        tableView.register(MessageCell.self, forCellReuseIdentifier: K.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.addSubview(messageTextField)
        containerView.addSubview(enterButton)
        
        enterButton.addTarget(self, action: #selector(tapEnterButton), for: .touchUpInside)
    }
    
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Private Action
    
    @objc private func tapEnterButton(){
        if let text = messageTextField.text, !text.isEmpty {
            messages.append(Message(sender: .me, body: text))
            messageTextField.text = ""
            tableView.reloadData()
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
}

// MARK: - Setup Constraints

extension ChatViewController {
    private func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(tableView.snp.bottom)
            make.height.equalTo(60)
        }
        
        messageTextField.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(messageTextField.snp.trailing).offset(20)
            make.height.width.equalTo(40)
        }
        
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as? MessageCell else {
            fatalError()
        }
        let model = messages[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    
}

//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        ChatViewController().showPreview()
//    }
//}

