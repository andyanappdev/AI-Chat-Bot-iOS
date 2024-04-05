//
//  MessageRepository.swift
//  ChatBot
//
//  Created by 권태호 on 28/03/2024.
//

import Foundation

class MessageRepository {
    private var messagesStorage: [RequestMessageModel] = []
    private let repoQueue = DispatchQueue(label: "repoQueue")
    
    
    func addMessage(_ message: RequestMessageModel) {
        repoQueue.async {
            self.messagesStorage.append(message)
        }
    }
    
    func getMessages() -> [RequestMessageModel] {
        return repoQueue.sync {
            messagesStorage
        }
    }
    
    func clearStorage() {
        repoQueue.sync {
            self.messagesStorage.removeAll()
        }
    }
}
