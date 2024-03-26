//
//  APIKeyManager.swift
//  ChatBot
//
//  Created by 권태호 on 26/03/2024.
//

import Foundation

struct APIKeyManager {
   static let APIKey = Bundle.main.infoDictionary?["OpenAIKey"] as! String
}
