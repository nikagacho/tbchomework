//
//  TVShows.swift
//  Task17
//
//  Created by Nikoloz Gachechiladze on 29.10.23.
//

import UIKit

struct tvShow {
    let name: String?
    let imageName: String?
    var imageData: Data?
}
var allShows: [tvShow] = [
tvShow(name: "The Wire", imageName: "theWire"),
tvShow(name: "Breaking Bad", imageName: "breakingBad"),
tvShow(name: "The Manifest", imageName: "manifest"),
tvShow(name: "The Walking Dead", imageName: "theWalkingDead"),
tvShow(name: "My Wife's Girlfriends", imageName: "myWife"),
tvShow(name: "Luther", imageName: "luther"),
tvShow(name: "Hot Dog", imageName: "hotDog"),
tvShow(name: "Ted Lasso", imageName: "tedLasso")
]

