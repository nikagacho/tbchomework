//
//  MainScreenViewModel.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    
    let networkManager = NetworkManager<Cities>()
    let travelingTips: [String] = [
        "Pack light and smart: Choose versatile clothing and essentials.",
        "Plan your budget: Set a realistic daily spending limit for a stress-free journey.",
        "Learn basic local phrases to enhance communication and show respect.",
        "Keep important documents secure: Make digital copies and store them online.",
        "Stay hydrated: Drink plenty of water to stay energized and healthy.",
        "Embrace local cuisine: Try regional dishes for an authentic experience.",
        "Stay flexible with plans: Be adaptable to unexpected changes in your itinerary.",
        "Use public transportation to save money and experience local life.",
        "Respect local customs: Adhere to cultural norms for a positive impression.",
        "Capture memories responsibly: Be mindful of local rules when taking photos."
    ]
    
    @Published var cities: Cities = Cities(cities: [])
    
     func fetchCities() {
        let url = "https://mocki.io/v1/b8727cf3-59af-4643-8f22-d097ef419481"
        Task {
            cities = try await networkManager.fetchData(from: url)
        }
        
    }
    
}
