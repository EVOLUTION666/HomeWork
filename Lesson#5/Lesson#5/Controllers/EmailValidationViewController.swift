//
//  EmailValidationViewController.swift
//  Lesson#5
//
//  Created by Andrey on 05.03.2022.
//

import UIKit

class EmailValidationViewController: UIViewController {
    
    let validationView = ValidationView(placeHolder: .email)
    let regularExpression = RegularExpression()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationView.validationButton.addTarget(self, action: #selector(didTapCheckEmailButton), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        self.view = validationView
    }
    
    @objc func didTapCheckEmailButton() {
        if validationView.validationTextField.text != nil {
            regularExpression.expression(expressionEnum: .email, validationView: validationView)
        }
    }
}
