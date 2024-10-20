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
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var containerView : UIView = {
        let element = UIView()
        element.backgroundColor = .yellow
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var enterButton : UIButton = {
        let element = UIButton(type: .system)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.cellIdentifier)
        view.addSubview(tableView)
    }
    
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Private Action
}

// MARK: - Setup Constraints

extension ChatViewController {
    private func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Cell number: \(indexPath.row + 1)"
        return cell
    }
    
    
}


struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ChatViewController().showPreview()
    }
}
