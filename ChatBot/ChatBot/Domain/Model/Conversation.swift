//
//  Conversation.swift
//  ChatBot
//
//  Created by Doyoung An on 3/27/24.
//

class Conversation: Encodable {
    private var messages: [Message]
    
    init(messages: [Message]) {
        self.messages = []
    }
    
    func addNewMessage(role: MessageRole = MessageRole.user, content: String) {
        let newMessage = Message(role: role, content: content)
        messages.append(newMessage)
    }
    
    func fetchMessages() -> [Message] {
        return messages
    }
}
