//
//  ViewController.swift
//  ChatBot
//
//  Created by Tacocat on 1/1/24.
//
import UIKit

class ViewController: UIViewController {
    private var viewModel: ChatViewModel!
    private var repo: MessageRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        repo = MessageRepository()
        let openAIService = OpenAIService()
        viewModel = ChatViewModel(repository: repo, apiService: openAIService)
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
        sendButton.setTitle("clearRepo", for: .normal)
        sendButton.addTarget(self, action: #selector(messageClear), for: .touchUpInside)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
        ])
    }
    
    @objc private func sendMessage() {
        let message = "IOS 개발자가 되기 위한 구체적인 계획"
        DispatchQueue.main.async {
            self.viewModel.processUserMessage(message)
        }
    }
    
   @objc func printMessageRepositoryContents() {
       let messages = repo.getMessages()
        print("""
        😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃
        \(messages)
        😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃
        """)
    }
    
    @objc func messageClear() {
        repo.clearStorage()
     }

}
