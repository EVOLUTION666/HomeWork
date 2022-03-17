//
//  CustomHeaderView.swift
//  TableFootbal
//
//  Created by Andrey on 16.03.2022.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
    
    lazy var ligueName: UILabel = {
        let ligueName = UILabel()
        ligueName.text = "RussianLigue"
        ligueName.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        ligueName.translatesAutoresizingMaskIntoConstraints = false
        return ligueName
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


