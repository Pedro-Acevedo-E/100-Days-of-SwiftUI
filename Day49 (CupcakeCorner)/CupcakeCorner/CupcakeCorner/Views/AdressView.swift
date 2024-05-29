//
//  AdressView.swift
//  CupcakeCorner
//
//  Created by Pedro Acevedo on 29/05/24.
//

import SwiftUI

struct AddressView: View {
    var order: Order

    var body: some View {
        Text("Add sprinkles?: ")
        Text(String(order.addSprinkles))
    }
}

#Preview {
    AddressView(order: Order())
}
