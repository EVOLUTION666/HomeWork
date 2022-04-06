//
//  CourseTableViewCell.swift
//  HomeWork#6
//
//  Created by Andrey on 09.03.2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    let backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 12
        backView.clipsToBounds = true
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    let specialOfferView: UIView = {
        let specialOfferView = UIView()
        specialOfferView.backgroundColor = UIColor(red: 255/255,
                                           green: 255/255,
                                           blue: 255/255,
                                                   alpha: 1)
        specialOfferView.layer.borderColor = UIColor(red: 142/255,
                                                     green: 142/255,
                                                     blue: 147/255,
                                                     alpha: 1).cgColor
        specialOfferView.layer.borderWidth = 1
        specialOfferView.layer.cornerRadius = 10
        specialOfferView.clipsToBounds = true
        specialOfferView.translatesAutoresizingMaskIntoConstraints = false
        return specialOfferView
    }()
    
    let specialOfferLabel: UILabel = {
        let specialOfferLabel = UILabel()
        specialOfferLabel.textColor = UIColor(red: 142/255,
                                              green: 142/255,
                                              blue: 147/255,
                                              alpha: 1)
        specialOfferLabel.textColor = .black
        specialOfferLabel.numberOfLines = 0
        specialOfferLabel.translatesAutoresizingMaskIntoConstraints = false
        return specialOfferLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = UIColor(red: 51/255,
                                             green: 51/255,
                                             blue: 51/255,
                                             alpha: 1)
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()

    let moreButton: UIButton = {
        let moreButton = UIButton()
        moreButton.setTitleColor(UIColor(red: 142/255,
                                         green: 142/255,
                                         blue: 147/255,
                                         alpha: 1), for: .normal)
        moreButton.setTitle("Подробнее", for: .normal)
        moreButton.contentHorizontalAlignment = .left
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
    }()

    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = UIColor(red: 51/255,
                                       green: 51/255,
                                       blue: 51/255,
                                       alpha: 1)
        priceLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()

    let addButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.setTitleColor(.white, for: .normal)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        addButton.backgroundColor = UIColor(red: 18/255,
                                            green: 139/255,
                                            blue: 227/255,
                                            alpha: 1)
        addButton.layer.cornerRadius = 4
        addButton.clipsToBounds = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        return addButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 223/255,
                                                   green: 222/255,
                                                   blue: 226/255,
                                                   alpha: 1)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(backView)
        backView.addSubview(specialOfferView)
        specialOfferView.addSubview(specialOfferLabel)
        backView.addSubview(descriptionLabel)
        backView.addSubview(moreButton)
        backView.addSubview(priceLabel)
        backView.addSubview(addButton)
    }
    
    func setup(model: Course) {
        if model.specialOffer == nil {
            specialOfferView.isHidden = true
        } else {
            specialOfferLabel.text = model.specialOffer
        }
        descriptionLabel.text = model.description
        priceLabel.text = model.price
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            specialOfferView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            specialOfferView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            specialOfferView.trailingAnchor.constraint(lessThanOrEqualTo: backView.trailingAnchor, constant: -20),

            specialOfferLabel.topAnchor.constraint(equalTo: specialOfferView.topAnchor, constant: specialOfferLabel.text == nil ? 0 : 4),
            specialOfferLabel.bottomAnchor.constraint(equalTo: specialOfferView.bottomAnchor, constant: specialOfferLabel.text == nil ? 0 : -4),
            specialOfferLabel.leadingAnchor.constraint(equalTo: specialOfferView.leadingAnchor, constant: 12),
            specialOfferLabel.trailingAnchor.constraint(equalTo: specialOfferView.trailingAnchor, constant: -12),
            
            descriptionLabel.topAnchor.constraint(equalTo: specialOfferView.bottomAnchor, constant: specialOfferLabel.text == nil ? 0 : 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),

            moreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            moreButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            moreButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),

            addButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            addButton.topAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 16),
            addButton.widthAnchor.constraint(equalToConstant: 72),
            addButton.heightAnchor.constraint(equalToConstant: 36),

            priceLabel.topAnchor.constraint(greaterThanOrEqualTo: moreButton.bottomAnchor, constant: 23),
            priceLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -8),
        ])
    }
    
    
}
