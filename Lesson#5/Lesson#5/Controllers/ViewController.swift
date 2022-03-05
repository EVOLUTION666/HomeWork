//
//  ViewController.swift
//  Lesson#5
//
//  Created by Andrey on 05.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nameButton: ValidationButton = {
        let nameButton = ValidationButton()
        nameButton.setTitle("NAME VALIDATION", for: .normal)
        nameButton.addTarget(self, action: #selector(didTapNameValidationButton), for: .touchUpInside)
        
        return nameButton
    }()
    
    private lazy var emailButton: ValidationButton = {
        let emailButton = ValidationButton()
        emailButton.setTitle("EMAIL VALIDATION", for: .normal)
        emailButton.addTarget(self, action: #selector(didTapEmailValidationButton), for: .touchUpInside)
        
        return emailButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView()
        view.backgroundColor = .white
        
        configureUI()
    }
    
    func configureUI() {
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameButton)
        stackView.addArrangedSubview(emailButton)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nameButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            nameButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            nameButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            nameButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            nameButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            emailButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            emailButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            emailButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
        ])
    }
    
    @objc func didTapNameValidationButton() {
        navigationController?.pushViewController(NameValidationViewController(), animated: true)
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func didTapEmailValidationButton() {
        navigationController?.modalPresentationStyle = .pageSheet
        navigationController?.present(EmailValidationViewController(), animated: true)
    }
}
