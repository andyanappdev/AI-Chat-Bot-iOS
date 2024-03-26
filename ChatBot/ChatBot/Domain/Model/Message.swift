//
//  Message.swift
//  ChatBot
//
//  Created by Doyoung An on 3/26/24.
//

enum MessageRole: Codable {
    case system, user, assistant, tool
}

struct Message: Codable {
    let role: MessageRole
    let content: String
}
