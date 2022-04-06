//
//  Course.swift
//  HomeWork#6
//
//  Created by Andrey on 09.03.2022.
//

import Foundation

struct Course {
    var specialOffer: String?
    var description: String
    var price: String
    
//    init(specialOffer: String?, description: String, price: String) {
//        self.specialOffer = specialOffer
//        self.description = description
//        self.price = price
//    }
}

let courseList = [
    Course(specialOffer: "Первые 3 занятия бесплатно",
           description: "Backend разработка",
           price: "7 840 ₽"),
    Course(specialOffer: "01.02.2022 - 01.04.2022 Скидка 10%",
           description: "Курсы по Android разработке",
           price: "9 800 ₽"),
    Course(specialOffer: nil,
           description: "Курсы по iOS разработке + Computer Science + Computer Vision + System Design",
           price: "11 760 ₽"),
    
    Course(specialOffer: "Первые 3 занятия бесплатно",
           description: "Backend разработка",
           price: "7 840 ₽"),
    Course(specialOffer: "01.02.2022 - 01.04.2022 Скидка 10%",
           description: "Курсы по Android разработке",
           price: "9 800 ₽"),
    Course(specialOffer: nil,
           description: "Курсы по iOS разработке + Computer Science + Computer Vision + System Design",
           price: "11 760 ₽"),
]
