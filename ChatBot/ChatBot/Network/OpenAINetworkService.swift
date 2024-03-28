import Foundation

class OpenAIService {
    
    func sendRequestToOpenAI(_ messages: [RequestMessageModel], completion: @escaping (Result<[Message], Error>) -> Void) {
        let endpoint = OpenAIEndPoint.chatCompletionsBaseURL
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.addValue("Bearer \(APIKeyManager.openAIAPIKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": messages.map { ["role": $0.role.rawValue, "content": $0.content] }
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let responseDTO = try JSONDecoder().decode(OpenAICheatResponseDTO.self, from: data)
                // DTO에서 Model로 변환
                let messages = responseDTO.choices.compactMap { choice -> Message? in
                    guard let messageContent = choice.message?.content, let messageRole = choice.message?.role else { return nil }
                    return Message(role: (MessageRole(rawValue: messageRole) ?? .assistant).rawValue, content: messageContent)
                }
                completion(.success(messages))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

