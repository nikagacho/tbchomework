//
//  HotelsView.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import SwiftUI

struct HotelsView: View {
    //MARK: - Passed in Object
    var city: City
    //MARK: - View
    var body: some View {
        VStack {
            Text("Best hotels to stay at in \(city.name)")
                .bold()
                .font(.system(size: 24))
            List {
                ForEach(city.hotels, id: \.self) { hotels in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.1))
                        .overlay(
                            Text(hotels)
                                .padding()
                        )
                        .padding(.vertical, 5)
                }
            }
            .background(Color.white)
        }
    }
}


