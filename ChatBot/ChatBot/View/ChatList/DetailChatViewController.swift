//
//  DetailChatViewController.swift
//  ChatBot
//
//  Created by 권태호 on 05/04/2024.
//

import UIKit

class DetailChatViewController: UIViewController {
    var repo: MessageRepository
    var viewModel: ChatViewModel
    var apiService: OpenAIService
    
    init(repo: MessageRepository, viewModel: ChatViewModel, apiService: OpenAIService) {
        self.repo = repo
        self.viewModel = viewModel
        self.apiService = apiService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}

