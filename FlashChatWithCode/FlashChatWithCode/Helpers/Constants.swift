//
//  Constants.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 18.10.2024.
//

import UIKit

struct K {
    static let appName = "⚡️FlashChat"
    static let logInName = "Log In"
    static let registerName = "Register"
    static let emailName = "Email"
    static let passwordName = "Password"
    
    static let enterButtonImageName = "paperplane.fill"
    static let enterMessagePlaceholder = "Write a message..."
    
    static let meAvatar = "MeAvatar"
    static let youAvatar = "YouAvatar"
    
    static let cellIdentifier = "MessageCell"
    
    static let textfieldImageName = "textfield"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct Size {
        static let buttonSize: CGFloat = 48
        static let buttonOffset: CGFloat = 8
        static let textFieldInset: CGFloat = 36
        static let textFieldHeight: CGFloat = 60
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
