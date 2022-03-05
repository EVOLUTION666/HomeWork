//
//  RequiredLabel.swift
//  HomeWork#5
//
//  Created by Andrey on 05.03.2022.
//

import UIKit

class RequiredLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLabel()
    }
    
    func configureLabel() {
        font = UIFont.systemFont(ofSize: 25)
        textColor = .red
        text = "Required"
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
