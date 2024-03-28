//
//  File.swift
//  ChatBot
//
//  Created by 권태호 on 26/03/2024.
//

import Foundation

struct RequestMessageModel: Codable {
    let role: MessageRole
    let content: String
}

enum MessageRole: String, Codable {
    case user = "user"
    case assistant = "assistant"
    case system = "system"
}

