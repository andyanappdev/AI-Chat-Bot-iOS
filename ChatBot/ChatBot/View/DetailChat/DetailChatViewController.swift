//
//  DetailChatViewController.swift
//  ChatBot
//
//  Created by 권태호 on 05/04/2024.
//

import UIKit

final class DetailChatViewController: UIViewController {
    var repo: MessageRepository
    var viewModel: ChatViewModel
    var apiService: OpenAIService
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
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

extension DetailChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}

