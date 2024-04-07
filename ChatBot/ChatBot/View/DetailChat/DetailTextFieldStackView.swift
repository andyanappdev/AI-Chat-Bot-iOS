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
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private var doneButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrowshape.up")
        button.setImage(image, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        configureStackView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLayoutSubviews()
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
            doneButton.heightAnchor.constraint(equalTo: UserinputTextField.heightAnchor),
            doneButton.widthAnchor.constraint(equalTo: doneButton.heightAnchor)
        ])
    }
    
    private func configureLayoutSubviews() {
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
    }
}
