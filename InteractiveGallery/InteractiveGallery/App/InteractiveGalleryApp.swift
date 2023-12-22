//
//  InteractiveGalleryApp.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

@main
struct InteractiveGalleryApp: App {
    
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                GalleryView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .delacroix:
                            DelacroixView()
                        case .fisherman:
                            FishermanView()
                        case .guernica:
                            GuernicaView()
                        case .primavera:
                            PrimaveraView()
                        case .scream:
                            ScreamView()
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
