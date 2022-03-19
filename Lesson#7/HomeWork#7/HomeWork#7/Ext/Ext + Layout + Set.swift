//
//  Ext + Layout.swift
//  HomeWork#7
//
//  Created by Andrey on 18.03.2022.
//

import UIKit

//MARK: - CustomAlbumCell

extension CustomAlbumCell {
    
    func setAddSubviews() {
        contentView.addSubview(albumImage)
        contentView.addSubview(albumName)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(addButton)
    }
    
    func setupRating(model: Album) -> String{
        switch model.rating {
        case 1:
            return "Rating:⭐"
        case 2:
            return "Rating:⭐⭐"
        case 3:
            return "Rating:⭐⭐⭐"
        case 4:
            return "Rating:⭐⭐⭐⭐"
        case 5:
            return "Rating:⭐⭐⭐⭐⭐"
        default:
            return ""
        }
    }
    
    func setupModel(model: Album) {
        albumImage.image = UIImage(named: model.albumImage)
        albumName.text = model.albumName
        ratingLabel.text = setupRating(model: model)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            albumImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            albumImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            albumImage.widthAnchor.constraint(equalToConstant: 50),
            albumImage.heightAnchor.constraint(equalToConstant: 50),
            
            albumName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            albumName.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 20),
            albumName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            ratingLabel.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: albumName.numberOfLines == 2 ? 20 : 0),
            ratingLabel.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 20),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            ratingLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor),
            
            addButton.topAnchor.constraint(equalTo: ratingLabel.topAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

//MARK: - CustomHeaderView

extension CustomHeaderView {
    func setupAddSubviews() {
        contentView.addSubview(sectionTitle)
        contentView.addSubview(sectionButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sectionTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            sectionTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            sectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            sectionTitle.trailingAnchor.constraint(equalTo: sectionButton.leadingAnchor, constant: -5),
            
            sectionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            sectionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            sectionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            sectionButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
