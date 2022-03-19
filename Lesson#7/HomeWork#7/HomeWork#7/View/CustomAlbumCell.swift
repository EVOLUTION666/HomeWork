//
//  CustomAlbumCell.swift
//  HomeWork#7
//
//  Created by Andrey on 17.03.2022.
//

import UIKit

class CustomAlbumCell: UITableViewCell {
    
    lazy var albumImage: UIImageView = {
        let albumImage = UIImageView()
        albumImage.clipsToBounds = true
        albumImage.layer.cornerRadius = 5
        albumImage.contentMode = .scaleAspectFill
        albumImage.backgroundColor = .blue
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        return albumImage
    }()
    
    lazy var albumName: UILabel = {
        let albumName = UILabel()
        albumName.text = "Metheora"
        albumName.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        albumName.numberOfLines = 0
        albumName.translatesAutoresizingMaskIntoConstraints = false
        return albumName
    }()
    
    lazy var ratingLabel: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.text = "Rating: 5"
        ratingLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        return ratingLabel
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.layer.cornerRadius = 3
        addButton.clipsToBounds = true
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemGreen
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAddSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
