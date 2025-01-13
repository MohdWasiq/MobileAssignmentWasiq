//
//  AssignmentText.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
import SwiftUI

struct AssignmentText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.blue)
    }
}
