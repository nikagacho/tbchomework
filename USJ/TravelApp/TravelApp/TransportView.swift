//
//  TransportView.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import SwiftUI

struct TransportView: View {
    //MARK: - Passed in Object
    var city: City
    //MARK: - View
    var body: some View {
        VStack {
            Text("Transports you can use in \(city.name)")
                .bold()
                .font(.system(size: 24))
            List {
                ForEach(city.transport, id: \.self) { transport in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.1))
                        .overlay(
                            Text(transport)
                                .padding()
                        )
                        .padding(.vertical, 5)
                }
            }
            .background(Color.white)
        }
    }
}
