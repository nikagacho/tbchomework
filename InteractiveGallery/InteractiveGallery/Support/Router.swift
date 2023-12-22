//
//  Router.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import Foundation
import SwiftUI

/*
 ეს უბრალოდ გავაკეთე, არანაირი საჭიროება არ იყო დავალებაში მარა მინდოდა გატესტვა...
 ძაან კაია პროგრამატიკ ნავიგაცია <3
 */

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case guernica
        case fisherman
        case scream
        case delacroix
        case primavera
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

}
