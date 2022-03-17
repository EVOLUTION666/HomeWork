//
//  Teams.swift
//  TableFootbal
//
//  Created by Andrey on 15.03.2022.
//

import Foundation
import UIKit

struct Ligue {
    let ligueName: String
    var teams: [Teams]
}

struct Teams {
    var teamName: String
}

var ligueList = [
    Ligue.init(ligueName: "Russian Ligue", teams: [Teams.init(teamName: "CSKA"),
                                                   Teams.init(teamName: "Spartak"),
                                                   Teams.init(teamName: "Dynamo"),
                                                   Teams.init(teamName: "Rostov"),]),
    Ligue.init(ligueName: "Spain Ligue", teams: [Teams.init(teamName: "Real Madrid"),
                                                 Teams.init(teamName: "Barselona"),
                                                 Teams.init(teamName: "Sevilia"),
                                                 Teams.init(teamName: "Athletico")]),
    Ligue.init(ligueName: "Italian Ligue", teams: [Teams.init(teamName: "Milan"),
                                                   Teams.init(teamName: "Juventus"),
                                                   Teams.init(teamName: "Napoli"),
                                                   Teams.init(teamName: "Roma"),]),
    Ligue.init(ligueName: "Bundest Ligue", teams: [Teams.init(teamName: "Borrusia Dortmund"),
                                                 Teams.init(teamName: "Baern"),
                                                 Teams.init(teamName: "Gerta"),
                                                 Teams.init(teamName: "Shtuthart")]),
]
