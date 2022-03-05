//
//  ValidationTextField.swift
//  HomeWork#5
//
//  Created by Andrey on 05.03.2022.
//

import UIKit

class ValidationTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTextField()
    }
    
    func configureTextField() {
        font = UIFont.systemFont(ofSize: 25)
        clipsToBounds = true
        layer.cornerRadius = 3
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
