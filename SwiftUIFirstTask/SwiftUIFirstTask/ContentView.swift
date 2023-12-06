//
//  ContentView.swift
//  SwiftUIFirstTask
//
//  Created by Nikoloz Gachechiladze on 06.12.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "arrowshape.backward.fill")
                    Spacer()
                    Text("Edit Profile")
                        .font(.system(size: 20))
                        .bold()

                    Spacer()
                }
                Image(.girl)
                    .background(
                        Circle())
            }
            VStack(alignment: .leading, spacing: 11) {
                Text("Name")
                    .font(.system(size: 14))
                    .bold()
                TextField(".test", text: .constant(""))
                    .padding()
                    .font(.system(size: 14))
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.5)
                            .padding([.top, .bottom], 7)
                    )
            }

            VStack(alignment: .leading, spacing: 11) {
                Text("E-Mail")
                    .font(.system(size: 14))
                    .bold()
                TextField("dummy@johndoe.com", text: .constant(""))
                    .padding()
                    .font(.system(size: 14))
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.5)
                            .padding([.top, .bottom], 7)
                    )
            }
            VStack(alignment: .leading, spacing: 11) {
                Text("Password")
                    .font(.system(size: 14))
                    .bold()
                TextField("********", text: .constant(""))
                    .padding()
                    .font(.system(size: 14))
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.5)
                            .padding([.top, .bottom], 7)
                    )
            }
            VStack(alignment: .leading, spacing: 11) {
                Text("Date of Birth")
                    .font(.system(size: 14))
                    .bold()
                TextField("Type a date", text: .constant(""))
                    .padding()
                    .font(.system(size: 14))
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.5)
                            .padding([.top, .bottom], 7)
                    )
            }
            VStack(alignment: .leading, spacing: 11) {
                Text("Country/Region")
                    .font(.system(size: 14))
                    .bold()
                TextField("Select a Country", text: .constant(""))
                    .padding()
                    .font(.system(size: 14))
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.5)
                            .padding([.top, .bottom], 7)
                    )
            }
            Button("Save Changes") {
                print("Button Tapped")
            }
            .padding([.all], 8)
            .frame(width: 221, height: 45)
            .foregroundColor(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 0.5)
                    .fill(Color.init(red: 0.14, green: 0.15, blue: 0.30))
            )
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
