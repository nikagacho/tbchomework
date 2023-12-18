//
//  BalanceView.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 19.12.23.
//

import SwiftUI

struct BalanceView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            Text("Balance: \(String(format: "%.2f", viewModel.balance)) $")
                .bold()
            Image(systemName: "creditcard.circle.fill")
        }
    }
}

