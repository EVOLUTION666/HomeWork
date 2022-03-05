//
//  NameValidationViewController.swift
//  Lesson#5
//
//  Created by Andrey on 05.03.2022.
//

import UIKit

class NameValidationViewController: UIViewController {
    
    let validationView = ValidationView(placeHolder: .name)
    let regularExpression = RegularExpression()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationView.validationButton.addTarget(self, action: #selector(didTapCheckNameButton), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        self.view = validationView
    }
    
    @objc func didTapCheckNameButton() {
        if validationView.validationTextField.text != nil {
            regularExpression.expression(expressionEnum: .name, validationView: validationView)
        }
    }
    
}


