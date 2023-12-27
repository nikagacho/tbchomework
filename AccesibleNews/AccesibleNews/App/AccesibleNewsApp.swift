//
//  AccesibleNewsApp.swift
//  AccesibleNews
//
//  Created by Nikoloz Gachechiladze on 27.12.23.
//

import SwiftUI

@main
struct AccesibleNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NewsView(viewModel: NewsViewModel())
        }
    }
}
