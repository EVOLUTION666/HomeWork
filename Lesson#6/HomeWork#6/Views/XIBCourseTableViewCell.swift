//
//  XIBCourseTableViewCell.swift
//  HomeWork#6
//
//  Created by Andrey on 09.03.2022.
//

import UIKit

class XIBCourseTableViewCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var specialOfferViewXIB: UIView!
    @IBOutlet var specialOfferLabelXIB: UILabel!
    @IBOutlet var descriptionLabelXIB: UILabel!
    @IBOutlet var moreButtonXIB: UIButton!
    @IBOutlet var priceLabelXIB: UILabel!
    @IBOutlet var addButtonXIB: UIButton!
    
    var model: Course?

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 12
        addButtonXIB.clipsToBounds = true
        addButtonXIB.layer.cornerRadius = 4
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(model: Course) {
        self.model = model
        if model.specialOffer == nil {
            specialOfferViewXIB.isHidden = true
        } else {
            specialOfferLabelXIB.text = model.specialOffer
            specialOfferViewXIB.isHidden = false
        }
        descriptionLabelXIB.text = model.description
        priceLabelXIB.text = model.price
    }
    
}
