//
//  Divider.swift
//  Moonshot
//
//  Created by Pedro Acevedo on 20/05/24.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    Divider()
}
