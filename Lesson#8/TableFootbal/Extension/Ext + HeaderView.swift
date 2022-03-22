//
//  Ext + HeaderView.swift
//  TableFootbal
//
//  Created by Andrey on 17.03.2022.
//

import UIKit

//MARK: - CustomHeaderView

extension CustomHeaderView {
    func setupHeaderView() {
        self.addSubview(ligueName)
        self.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            ligueName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            ligueName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            ligueName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ligueName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),

            addButton.topAnchor.constraint(equalTo: ligueName.topAnchor),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: ligueName.bottomAnchor)
        ])
    }
}
