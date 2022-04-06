//
//  AutoLayoutViewController.swift
//  HomeWork#6
//
//  Created by Andrey on 09.03.2022.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
    }
}
