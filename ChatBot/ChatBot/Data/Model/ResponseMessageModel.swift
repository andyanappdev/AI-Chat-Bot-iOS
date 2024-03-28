//
//  ResponDataStrcure.swift
//  ChatBot
//
//  Created by 권태호 on 26/03/2024.
//

import Foundation

struct ResponseMessageModel: Codable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let messages: [Message]
    let usage: Usage
    let systemFingerprint: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case object
        case created
        case model
        case messages = "choices"
        case usage
        case systemFingerprint = "system_fingerprint"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        object = try container.decode(String.self, forKey: .object)
        created = try container.decode(Int.self, forKey: .created)
        model = try container.decode(String.self, forKey: .model)
        usage = try container.decode(Usage.self, forKey: .usage)
        systemFingerprint = try container.decodeIfPresent(String.self, forKey: .systemFingerprint)
        
        var messages = [Message]()
        let choices = try container.decode([Choice].self, forKey: .messages)
        for choice in choices {
            if let message = choice.message {
                let role = MessageRole(rawValue: message.role) ?? .assistant
                let content = message.content
                messages.append(Message(role: role.rawValue, content: content))
            }
        }
        self.messages = messages
    }
}


