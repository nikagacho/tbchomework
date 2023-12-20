//
//  JournalView.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import SwiftUI

struct JournalView: View {
    //MARK: - ViewModel
    @ObservedObject var viewModel = JournalViewModel()
    //MARK: - Body
    var body: some View {
        VStack {
            TitleView()
            FormView(viewModel: viewModel)
            NavigationStack {
                ListView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    JournalView()
}
