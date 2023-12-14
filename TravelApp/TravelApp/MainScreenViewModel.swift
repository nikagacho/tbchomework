//
//  MainScreenViewModel.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import Foundation

final class MainScreenViewModel {

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
    
    var cities = [
        City(name: "Prague",
             generalInfo: "Prague is the capital city of the Czech Republic, known for its stunning architecture and rich history.",
             imageName: "prague",
             transport: ["Tram", "Metro", "Bus", "Taxi"],
             mustSee: ["Charles Bridge", "Prague Castle", "Old Town Square"],
             hotels: ["Grand Hotel Bohemia", "Hotel Kings Court"]),

        City(name: "Vienna",
             generalInfo: "Vienna is the capital and largest city of Austria, famous for its classical music and imperial palaces.",
             imageName: "vienna",
             transport: ["Tram", "Metro", "Bus", "Taxi"],
             mustSee: ["Schönbrunn Palace", "St. Stephen's Cathedral", "Belvedere Palace"],
             hotels: ["Hotel Sacher", "The Ritz-Carlton Vienna"]),

        City(name: "Budapest",
             generalInfo: "Budapest is the capital of Hungary, known for its thermal baths and stunning Danube River views.",
             imageName: "budapest",
             transport: ["Tram", "Metro", "Bus", "Taxi", "Train"],
             mustSee: ["Buda Castle", "Fisherman's Bastion", "Chain Bridge"],
             hotels: ["Four Seasons Hotel Gresham Palace", "Kempinski Hotel Corvinus Budapest"]),

        City(name: "Heidelberg",
             generalInfo: "Heidelberg is a picturesque German town, famous for its medieval castle and historic university.",
             imageName: "heidelberg",
             transport: ["Bus", "Taxi", "Bicycle"],
             mustSee: ["Heidelberg Castle", "Old Bridge", "Philosopher's Walk"],
             hotels: ["Hotel Europäischer Hof Heidelberg", "Hotel Holländer Hof"]),

        City(name: "Tbilisi",
             generalInfo: "Tbilisi is the capital and largest city of Georgia, known for its diverse architecture and vibrant culture.",
             imageName: "tbilisi",
             transport: ["MicroBus", "Metro", "Bus", "Taxi", "E-Scooters"],
             mustSee: ["Narikala Fortress", "Old Town (Abanotubani)", "Freedom Square"],
             hotels: ["Rooms Hotel Tbilisi", "Radisson Blu Iveria Hotel", "Sheraton Metekhi Palace"])
    ]
    
}
