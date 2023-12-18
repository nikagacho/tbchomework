//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import SwiftUI

@main
struct StoreAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
                .environmentObject(MainViewModel())
        }
    }

}
