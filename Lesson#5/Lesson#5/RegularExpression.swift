//
//  RegularExpression.swift
//  Lesson#5
//
//  Created by Andrey on 05.03.2022.
//

import Foundation

enum ExpressionEnum {
    case name
    case email
}

class RegularExpression {
    
    func expression(expressionEnum: ExpressionEnum, validationView: ValidationView) {
        switch expressionEnum {
        case .name:
            let regularExpression = "[A-z]{1}[a-z]{1,23}+\\s+[A-z]{1}[a-z]{1,23}+\\s+[A-z]{1}[a-z]{1,23}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
            let isValid = predicate.evaluate(with: validationView.validationTextField.text)
            if !isValid {
                validationView.requiredLabel.text = "Name is wrong!"
                validationView.requiredLabel.textColor = .red
            } else {
                validationView.requiredLabel.text = "You enter valid name!"
                validationView.requiredLabel.textColor = .green
                validationView.validationButton.backgroundColor = .green
            }
        case .email:
            let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
            let isValid = predicate.evaluate(with: validationView.validationTextField.text)
            if !isValid {
                validationView.requiredLabel.text = "Email is wrong!"
                validationView.requiredLabel.textColor = .red
            } else {
                validationView.requiredLabel.text = "You enter valid email!"
                validationView.requiredLabel.textColor = .green
                validationView.validationButton.backgroundColor = .green
            }
        }
    }
    
}
