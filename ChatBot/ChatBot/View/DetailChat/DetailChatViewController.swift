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
    var detailChatStackView: UIStackView = DetailTextFieldStackView()
    
    init(repo: MessageRepository, viewModel: ChatViewModel, apiService: OpenAIService) {
        self.repo = repo
        self.viewModel = viewModel
        self.apiService = apiService
        super.init(nibName: nil, bundle: nil)
        configureDetailChatStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    // MARK: - func
    private func configureDetailChatStackView() {
        
        self.view.addSubview(detailChatStackView)
        
        detailChatStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailChatStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            detailChatStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            detailChatStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailChatStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}

//extension DetailChatViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//}

