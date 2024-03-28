//
//  ViewController.swift
//  ChatBot
//
//  Created by Tacocat on 1/1/24.
//
import UIKit

class ViewController: UIViewController {
    private var viewModel: ChatViewModel!
     var repo: MessageRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let messageRepository = MessageRepository()
        let openAIService = OpenAIService()
        viewModel = ChatViewModel(repository: messageRepository, apiService: openAIService)
        
        setupUI()
        setupUI2()
        setupUI3()
    }
    
    private func setupUI() {
        // 메시지 전송 버튼 생성 및 레이아웃 설정
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send Message", for: .normal)
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupUI2() {
        // 메시지 전송 버튼 생성 및 레이아웃 설정
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("checkStorege", for: .normal)
        sendButton.addTarget(self, action: #selector(printMessageRepositoryContents), for: .touchUpInside)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        ])
    }
    
    private func setupUI3() {
        // 메시지 전송 버튼 생성 및 레이아웃 설정
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("printRepositoryContents", for: .normal)
        sendButton.addTarget(self, action: #selector(messageClear), for: .touchUpInside)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
        ])
    }
    
    @objc private func sendMessage() {
        //검증을 위한 코드
        let message = "내 꿈은 다음달 4월 취직"
        
    }
    
   @objc func printMessageRepositoryContents() {
        let messages = viewModel.repository.getMessages()
        print("""
        😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃
        \(messages)
        😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃
        """)
    }
    
    @objc func messageClear() {
        viewModel.repository.clearMessages()
     }

}
