//
//  ViewModel.swift
//  ChatBot
//
//  Created by 권태호 on 28/03/2024.
//
import Foundation
class ChatViewModel {
     let repository: MessageRepository
     let apiService: OpenAIService

    init(repository: MessageRepository, apiService: OpenAIService) {
        self.repository = repository
        self.apiService = apiService
    }
    
    func processUserMessage(_ content: String) {
        // 사용자 메시지를 저장
        let userMessage = Message(role: "user", content: content)
        repository.addMessage(userMessage)

        // API로 메시지 전송 및 응답 처리를 위해 RequestMessageModel 배열 생성
        let requestMessages = [RequestMessageModel(role: .user, content: content)]
        
        // sendRequestToOpenAI 메서드 호출
        apiService.sendRequestToOpenAI(requestMessages) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let receivedMessages):
                    // 응답 메시지를 저장. 이 과정에서 사용자 메시지 바로 다음에 응답 메시지가 저장되도록 함.
                    receivedMessages.forEach { responseMessage in
                        self?.repository.addMessage(responseMessage)
                    }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }

}
