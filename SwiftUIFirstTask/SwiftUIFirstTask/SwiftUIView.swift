//
//  SwiftUIView.swift
//  SwiftUIFirstTask
//
//  Created by Nikoloz Gachechiladze on 06.12.23.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var people = [
        Person(name: "Francisco Miles", text: "I went there yesterday", photo: "1", date: "18:11"),
        Person(name: "Arlene Fisher", text: "IDK what else is there to do", photo: "2", date: "17:55"),
        Person(name: "Darlene Hawkins", text: "I can't come tomorrow", photo: "3", date: "11:19"),
        Person(name: "Eduardo McKinney", text: "Go to hell", photo: "4", date: "Yesterday"),
        Person(name: "Aubrey Cooper", text: "I hope it goes well", photo: "5", date: "Yesterday"),
        Person(name: "Jorge Nguyen", text: "What are your plans?", photo: "6", date: "Yesterday"),
        Person(name: "Cody Cooper", text: "What's the progress on task?", photo: "7", date: "Friday"),
        Person(name: "Kristin Pena", text: "yeah, you're right", photo: "8", date: "Tuesday"),
        Person(name: "Brandie Watson", text: "I went there yesterday", photo: "9", date: "28/11/2023")
    ]
    
    @State var shouldReset = false
    
    var body: some View {
        VStack {
            Text("Chat")
                .font(.system(size: 17))
                .bold()
                .padding()
                .foregroundColor(.white)
            
            List(people, id: \.name) { person in
                MessageView(person: person)
            }
            .listStyle(PlainListStyle())
            if shouldReset == true {
                VStack {
                    Text("All conversations have been cleared.")
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Button(shouldReset ? "Reset" : "Clear") {
                if shouldReset {
                    people = [
                        Person(name: "Francisco Miles", text: "I went there yesterday", photo: "1", date: "18:11"),
                        Person(name: "Arlene Fisher", text: "IDK what else is there to do", photo: "2", date: "17:55"),
                        Person(name: "Darlene Hawkins", text: "I can't come tomorrow", photo: "3", date: "11:19"),
                        Person(name: "Eduardo McKinney", text: "Go to hell", photo: "4", date: "Yesterday"),
                        Person(name: "Aubrey Cooper", text: "I hope it goes well", photo: "5", date: "Yesterday"),
                        Person(name: "Jorge Nguyen", text: "What are your plans?", photo: "6", date: "Yesterday"),
                        Person(name: "Cody Cooper", text: "What's the progress on task?", photo: "7", date: "Friday"),
                        Person(name: "Kristin Pena", text: "yeah, you're right", photo: "8", date: "Tuesday"),
                        Person(name: "Brandie Watson", text: "I went there yesterday", photo: "9", date: "28/11/2023")
                    ]
                } else {
                    people = []
                }
                shouldReset.toggle()
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
        .background(Color.init(red: 0.2, green: 0.2, blue: 0.2))
    }
}

struct MessageView: View {
    let person: Person
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(person.photo)
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(person.name)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(person.text)
                    .padding(.all, 8)
                    .cornerRadius(10)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
            Spacer()
            Text(person.date)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.trailing)
        }
        .padding([.horizontal])
        .background(Color.init(red: 0.2, green: 0.2, blue: 0.2))
        .listRowBackground(Color(red: 0.2, green: 0.2, blue: 0.2))
        .listRowSeparator(.visible)
    }
}


#Preview {
    SwiftUIView()
}
