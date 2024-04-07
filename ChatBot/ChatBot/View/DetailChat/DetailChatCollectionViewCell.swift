//
//  ChatViewMessageCollectionViewCell.swift
//  ChatBot
//
//  Created by 권태호 on 05/04/2024.
//

import UIKit

class DetailChatCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailChatCollectionViewCell"
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMessageLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMessageLabel() {
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func configure(with content: RequestMessageModel) {
         messageLabel.text = content.content
         backgroundColor = content.role == .user ? .systemBlue : .gray
         messageLabel.textAlignment = content.role == .user ? .right : .left
    }
}
