//
//  ContentView.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import SwiftUI

struct MainScreenView: View {
    //MARK: - ViewModel
    var viewModel = MainScreenViewModel()
    //MARK: - Alert bool
    @State var isAlertShown = false
    //MARK: - View
    var body: some View {
        VStack {
            Text("Travel Destinations")
                .bold()
                .font(.title)
        }
        NavigationStack {
            ForEach(viewModel.cities, id: \.name) { city in
                NavigationLink(value: city) {
                    Text(city.name)
                        .font(.system(size: 40))
                }
                .navigationDestination(for: City.self) { city in
                    VStack(spacing: 10) {
                        Text(city.name)
                            .bold()
                            .font(.title)
                        Text(city.generalInfo)
                        Image(city.imageName)
                            .resizable()
                            .frame(width: 250, height: 200)
                            .border(Color.gray, width: 1)
                            .cornerRadius(8)
                        Spacer()
                        NavigationLink {
                            MustSeeView(city: city)
                        } label: {
                            Text("Must See")
                                .font(.system(size: 25))
                                .bold()
                                .foregroundColor(.black)
                        }
                        NavigationLink {
                            HotelsView(city: city)
                        } label: {
                            Text("Hotels")
                                .font(.system(size: 25))
                                .bold()
                                .foregroundColor(.black)
                        }
                        NavigationLink {
                            TransportView(city: city)
                        } label: {
                            Text("Transport")
                                .font(.system(size: 25))
                                .bold()
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding()
                }
            }
        }
        Button("Random Travelling tip") {
            isAlertShown.toggle()
        }
        .frame(width: 250)
        .padding()
        .background(Color.purple)
        .foregroundColor(.white)
        .cornerRadius(10)
        .alert(isPresented: $isAlertShown, content: {
            Alert(title: Text(viewModel.travelingTips.randomElement() ?? "No tips today"))
        })
        
    }
}

#Preview {
    MainScreenView()
}
