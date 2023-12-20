//
//  TitleView.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            HStack{
                Text("NewsApp")
                    .bold()
                    .font(.title)
                Image(systemName: "newspaper.fill")
            }
            Text("Where your news feel safe")
                .italic()
        }
    }
}

#Preview {
    TitleView()
}
