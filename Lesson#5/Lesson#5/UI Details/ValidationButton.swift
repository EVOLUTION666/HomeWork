//
//  ValidationButton.swift
//  HomeWork#5
//
//  Created by Andrey on 05.03.2022.
//

import UIKit

class ValidationButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    func configureButton() {
        titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
        clipsToBounds = true
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }

}
