//
//  ViewController.swift
//  maskHomework
//
//  Created by Andrey on 02.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Ivanov Ivan Ivanovich"
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return nameTextField
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "example@gmail.com"
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false

        return emailTextField
    }()
    
    private lazy var checkNameButton: UIButton = {
        let checkNameButton = UIButton()
        checkNameButton.setTitle("CHECK NAME", for: .normal)
        checkNameButton.backgroundColor = .red
        checkNameButton.setTitleColor(.black, for: .normal)
        checkNameButton.translatesAutoresizingMaskIntoConstraints = false
        checkNameButton.addTarget(self, action: #selector(didTapCheckNameButton), for: .touchUpInside)
        
        return checkNameButton
    }()
    
    private lazy var checkEmailButton: UIButton = {
        let checkEmailButton = UIButton()
        checkEmailButton.setTitle("CHECK EMAIL", for: .normal)
        checkEmailButton.backgroundColor = .red
        checkEmailButton.setTitleColor(.black, for: .normal)
        checkEmailButton.translatesAutoresizingMaskIntoConstraints = false
        checkEmailButton.addTarget(self, action: #selector(didTapCheckEmailButton), for: .touchUpInside)

        return checkEmailButton
    }()
    
    private lazy var alertNameLabel: UILabel = {
        let alertNameLabel = UILabel()
        alertNameLabel.text = "Please, enter valid name!"
        alertNameLabel.isHidden = true
        alertNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return alertNameLabel
    }()
    
    private lazy var alertEmailLabel: UILabel = {
        let alertEmailLabel = UILabel()
        alertEmailLabel.text = "Please, enter valid email!"
        alertEmailLabel.isHidden = true
        alertEmailLabel.translatesAutoresizingMaskIntoConstraints = false

        return alertEmailLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView()
        view.backgroundColor = .white
        
        configureUI()
        setConstraints()
    }

    func configureUI() {
        view.addSubview(nameTextField)
        view.addSubview(alertNameLabel)
        view.addSubview(checkNameButton)
        view.addSubview(emailTextField)
        view.addSubview(alertEmailLabel)
        view.addSubview(checkEmailButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            checkNameButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            checkNameButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            checkNameButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            alertNameLabel.topAnchor.constraint(equalTo: checkNameButton.bottomAnchor, constant: 20),
            alertNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            alertNameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: alertNameLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            checkEmailButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            checkEmailButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            checkEmailButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            alertEmailLabel.topAnchor.constraint(equalTo: checkEmailButton.bottomAnchor, constant: 20),
            alertEmailLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            alertEmailLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    @objc func didTapCheckNameButton() {
        if let nameData = nameTextField.text {
            let regularExpression = "^([A-z]{1}[a-z]{1,23}+\\s+[A-z]{1}[a-z]{1,23}+\\s+[A-z]{1}[a-z]{1,23})"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
            
            if !predicate.evaluate(with: nameData) {
                alertNameLabel.isHidden = false
                alertNameLabel.textColor = .red
            } else {
                alertNameLabel.text = "You enter valid data!"
                alertNameLabel.textColor = .green
                checkNameButton.backgroundColor = .green
            }
        }
    }
    
    @objc func didTapCheckEmailButton() {
        if let emailData = emailTextField.text {
            let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
            
            if !predicate.evaluate(with: emailData) {
                alertEmailLabel.isHidden = false
                alertEmailLabel.textColor = .red
            } else {
                alertEmailLabel.text = "You enter valid data!"
                alertEmailLabel.textColor = .green
                checkEmailButton.backgroundColor = .green
            }
        }
    }

}

