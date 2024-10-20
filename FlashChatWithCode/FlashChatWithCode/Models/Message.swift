//
//  Message.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 20.10.2024.
//

import Foundation


struct Message {
    
    enum Sender {
        case me, you
    }
    
    let sender: Sender
    let body: String
}

extension Message {
    static func getMessagers()-> [Message] {
        return [
            Message(sender: .you, body: "Text 1 dsds dsds sds dsdsd sd sdsds dsds sdsds sdsd s"),
            Message(sender: .me, body: "Text 2"),
            Message(sender: .you, body: "Text 3"),
            Message(sender: .me, body: "Text 4"),
            Message(sender: .you, body: "Text 5"),
            Message(sender: .me, body: "Text 6"),
            Message(sender: .you, body: "Text 7"),
            Message(sender: .me, body: "Text 8"),
            Message(sender: .you, body: "Text 9"),
            Message(sender: .me, body: "Text 10"),
        ]
    }
}
