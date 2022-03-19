//
//  CustomHeaderView.swift
//  HomeWork#7
//
//  Created by Andrey on 18.03.2022.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
    
    lazy var sectionTitle: UILabel = {
        let sectionTitle = UILabel()
        sectionTitle.text = "Rock"
        sectionTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        return sectionTitle
    }()
    
    lazy var sectionButton: UIButton = {
        let sectionButton = UIButton()
        sectionButton.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        sectionButton.tintColor = .red
        sectionButton.translatesAutoresizingMaskIntoConstraints = false
        return sectionButton
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupAddSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
