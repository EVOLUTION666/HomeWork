//
//  Album.swift
//  HomeWork#7
//
//  Created by Andrey on 17.03.2022.
//

import Foundation
import UIKit

struct Jenre {
    var jenreName: String
    var album: [Album]
    var isOpened = true
}

struct Album {
    var albumName: String
    var albumImage: String
    var rating: Int
}

var jenresList = [
    Jenre.init(jenreName: "Rock", album: [
        Album.init(albumName: "Hybrid Theory", albumImage: "hybrid-theory", rating: 5),
        Album.init(albumName: "Meteora", albumImage: "meteora", rating: 5),
        Album.init(albumName: "Nevermind", albumImage: "nevermind", rating: 4),
    ]),
    Jenre.init(jenreName: "Pop", album: [
        Album.init(albumName: "Thriller", albumImage: "thriller", rating: 3),
        Album.init(albumName: "The E.N.D.", albumImage: "end", rating: 5),
        Album.init(albumName: "fsjlsbvsvlsbvlsbvnsdlvblsnvsldvdsnvksnvksnfdsfsdfsdfsdfsfsfsd", albumImage: "end", rating: 5),
    ]),
    Jenre.init(jenreName: "Rap", album: [
        Album.init(albumName: "Certified Lover Boy", albumImage: "certified-lover-boy", rating: 5),
        Album.init(albumName: "DAMN.", albumImage: "damn", rating: 3),
        Album.init(albumName: "Madvillainy", albumImage: "madvillainy", rating: 4),
    ]),
]
