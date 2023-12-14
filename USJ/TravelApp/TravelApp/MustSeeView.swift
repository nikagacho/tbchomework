//
//  MustSeeView.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import SwiftUI

struct MustSeeView: View {
    //MARK: - Passed in Object
    var city: City
    //MARK: - View
    var body: some View {
        VStack {
            Text("Views you must see in \(city.name)!")
                .bold()
                .font(.system(size: 24))
            List {
                ForEach(city.mustSee, id: \.self) { mustSee in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.1))
                        .overlay(
                            Text(mustSee)
                                .padding()
                        )
                        .padding(.vertical, 5)
                }
            }
            .background(Color.white)
            
        }
    }
}

