//
//  Request.swift
//  ChatBot
//
//  Created by Doyoung An on 3/26/24.
//

import Foundation

enum AiModel: Encodable {
    case gpt3Turbo0125
    case gpt3Turbo
    case gpt3Turbo1106
    
    func aiModel() -> String {
        switch self {
        case AiModel.gpt3Turbo0125:
            return "gpt-3.5-turbo-0125"
        case AiModel.gpt3Turbo:
            return "gpt-3.5-turbo"
        case AiModel.gpt3Turbo1106:
            return "gpt-3.5-turbo-1106"
        }
    }
}

struct RequestBody: Encodable {
    let model: AiModel
    let messages: [Message]
    let stream: Bool
    let samplingTemperature: Double  // temperature
    let topProbability: Double  // top_p
    let numberOfCompletionChoices: Int  // n
    let maxTokens: Int // max_tokens
    let presencePenalty: Double  // presence_penalty
    let frequencyPenalty: Double // frequency_penalty
    
    init(model: AiModel = AiModel.gpt3Turbo1106, messages: [Message], stream: Bool = false, samplingTemperature: Double = 1.0, topProbability: Double = 1.0, numberOfCompletionChoices: Int = 1, maxTokens: Int = 250, presencePenalty: Double = 0.0, frequencyPenalty: Double = 0.0) {
            self.model = model
            self.messages = messages
            self.stream = stream
            self.samplingTemperature = samplingTemperature
            self.topProbability = topProbability
            self.numberOfCompletionChoices = numberOfCompletionChoices
            self.maxTokens = maxTokens
            self.presencePenalty = presencePenalty
            self.frequencyPenalty = frequencyPenalty
        }
    
    enum CodingKeys: String, CodingKey {
            case model
            case messages
            case stream
            case samplingTemperature = "temperature"
            case topProbability = "top_p"
            case numberOfCompletionChoices = "n"
            case maxTokens = "max_tokens"
            case presencePenalty = "presence_penalty"
            case frequencyPenalty = "frequency_penalty"
        }
}

extension RequestBody {
    func toJSON() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
