//
//  DetailTextFieldStackView.swift
//  ChatBot
//
//  Created by 권태호 on 05/04/2024.
//

import UIKit

class DetailTextFieldStackView: UIStackView {
    private var UserinputTextField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private var doneButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrowshape.up")
        button.setImage(image, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = button.bounds.width / 2
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - configure
    private func setupStackView() {
        self.axis = .horizontal
        self.spacing = 5
        self.distribution = .fill
        self.alignment = .center
   
    }
    
    private func configureStackView() {
        self.addArrangedSubview(UserinputTextField)
        self.addArrangedSubview(doneButton)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.widthAnchor.constraint(equalToConstant: 50),
            doneButton.heightAnchor.constraint(equalTo: doneButton.widthAnchor)
        ])
    }
    
}
