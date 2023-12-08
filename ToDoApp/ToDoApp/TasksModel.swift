//
//  TasksModel.swift
//  ToDoApp
//
//  Created by Nikoloz Gachechiladze on 08.12.23.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let taskName: String
    let taskDateString: String
}
