//
//  ValidationView.swift
//  Lesson#5
//
//  Created by Andrey on 05.03.2022.
//

import UIKit

enum PlaceHolder: String {
    case name = "Nefedov Andrey Alexeevich"
    case email = "example@gmail.com"
}

class ValidationView: UIView {

    private lazy var validationView: UIView = {
        let validationView = UIView()
        validationView.clipsToBounds = true
        validationView.layer.cornerRadius = 20
        validationView.backgroundColor = .black
        validationView.translatesAutoresizingMaskIntoConstraints = false
        
        return validationView
    }()
    
    lazy var validationTextField: ValidationTextField = {
        let validationTextField = ValidationTextField()
        return validationTextField
    }()
    
    lazy var requiredLabel: RequiredLabel = {
        let requiredLabel = RequiredLabel()
        return requiredLabel
    }()
    
    lazy var validationButton: ValidationButton = {
        let validationButton = ValidationButton()
        validationButton.setTitle("CHECK", for: .normal)
        validationButton.setTitleColor(.black, for: .normal)
        validationButton.backgroundColor = .white
        return validationButton
    }()
    
    init(placeHolder: PlaceHolder) {
        super.init(frame: .zero)
        self.validationTextField.placeholder = placeHolder.rawValue
        self.backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        self.addSubview(validationView)
        self.addSubview(validationTextField)
        self.addSubview(requiredLabel)
        self.addSubview(validationButton)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([

            validationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            validationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            validationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            validationView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            validationTextField.topAnchor.constraint(equalTo: validationView.topAnchor, constant: 16),
            validationTextField.leadingAnchor.constraint(equalTo: validationView.leadingAnchor, constant: 16),
            validationTextField.trailingAnchor.constraint(equalTo: validationView.trailingAnchor, constant: -16),
            
            validationButton.topAnchor.constraint(equalTo: validationTextField.bottomAnchor, constant: 16),
            validationButton.leadingAnchor.constraint(equalTo: validationView.leadingAnchor, constant: 16),
            validationButton.trailingAnchor.constraint(equalTo: validationView.trailingAnchor, constant: -16),
            
            requiredLabel.topAnchor.constraint(equalTo: validationButton.bottomAnchor, constant: 16),
            requiredLabel.leadingAnchor.constraint(equalTo: validationView.leadingAnchor, constant: 16),
            requiredLabel.trailingAnchor.constraint(equalTo: validationView.trailingAnchor, constant: -16),
            requiredLabel.bottomAnchor.constraint(equalTo: validationView.bottomAnchor, constant: -16)
        ])
    }
}
