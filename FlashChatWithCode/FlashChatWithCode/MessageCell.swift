//
//  MessageCell.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 20.10.2024.
//

import UIKit
import SnapKit
import SwiftUI

class MessageCell: UITableViewCell {
    
    // MARK: - Elements
    
    private var mainStackView = UIStackView()
    
    private lazy var leftImageView : UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: K.youAvatar)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var rightImageView : UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: K.meAvatar)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var messageView : UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var messageLabel : UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutIfNeeded()
        
        messageView.layer.cornerRadius = messageView.frame.height  / 4
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Properties
    
    public func configure(with model: Message){
        messageLabel.text = model.body
        
        switch model.sender {
        case .me:
            leftImageView.isHidden = true
            rightImageView.isHidden = false
            messageView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        case .you:
            leftImageView.isHidden = false
            rightImageView.isHidden = true
            messageView.backgroundColor = UIColor(named: K.BrandColors.purple)
            messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
    }
    
    // MARK: - Set view
    
    private func setView(){
        mainStackView = UIStackView(axis: .horizontal, distribution: .fill, alignment: .bottom, spacing: 20, subViews: [leftImageView, messageView, rightImageView])
        contentView.addSubview(mainStackView)
        messageView.addSubview(messageLabel)
        
        
    }
}

// MARK: - Setup constraints

extension MessageCell {
    private func setConstraints(){
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        leftImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
}
