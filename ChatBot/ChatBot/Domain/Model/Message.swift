//
//  Message.swift
//  ChatBot
//
//  Created by Doyoung An on 3/26/24.
//

enum MessageRole {
    case system, user, assistant, tool
}

struct Message {
    let role: MessageRole
    let content: String
}
