//
//  RequestMessageManager.swift
//  ChatBot
//
//  Created by 권태호 on 26/03/2024.
//

import Foundation

class MessageRepository {
var messagesStorage: [Message] = []
   
   // 새로운 메시지를 추가합니다.
   func addMessage(_ message: Message) {
       messagesStorage.append(message)
   }
   
   // 모든 메시지를 가져옵니다.
   func getMessages() -> [Message] {
       return messagesStorage
   }
   
   // 모든 메시지를 삭제합니다.
   func clearStorage() {
       messagesStorage.removeAll()
   }
}
