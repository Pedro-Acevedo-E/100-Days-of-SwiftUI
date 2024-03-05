//
//  ContentView.swift
//  unit_converter
//
//  Created by Pedro Acevedo on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputType = LenghtUnit.meter
    @State private var outputType = LenghtUnit.meter
    @State private var inputValue: Double = 0.0
    var outputValue: Double {
        var baseValue: Double = 0
        switch inputType {
        case .meter:
            baseValue = inputValue
        case .kilometer:
            baseValue = inputValue * 1000
        case .feet:
            baseValue = inputValue / 3.281
        case .yard:
            baseValue = inputValue / 1.094
        case .miles:
            baseValue = inputValue * 1609
        }
        
        switch outputType {
        case .meter:
            return baseValue
        case .kilometer:
            return baseValue / 1000
        case .feet:
            return baseValue * 3.281
        case .yard:
            return baseValue * 1.094
        case .miles:
            return baseValue / 1609
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Input: ")
                        Spacer()
                        TextField("Input", value: $inputValue, format: .number)
                            .keyboardType(.decimalPad)
                            
                    }
                    
                    Picker("Input type", selection: $inputType) {
                        ForEach(LenghtUnit.allCases) { unit in
                            Text(unit.label)
                                .tag(unit)
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text("Output: ")
                        Spacer()
                        Text(outputValue, format: .number)
                    }
                    
                    Picker("Output type", selection: $outputType) {
                        ForEach(LenghtUnit.allCases) { unit in
                            Text(unit.label)
                                .tag(unit)
                        }
                    }
                }
            }
        }
    }
}

enum LenghtUnit: String, CaseIterable, Identifiable  {
    case meter, kilometer, feet, yard, miles
    
    var id: UUID {
        return UUID()
    }
    
    var label: String {
        switch self {
        case .meter: return "Meter"
        case .kilometer: return "Kilometer"
        case .feet: return "Feet"
        case .yard: return "Yard"
        case .miles: return "Miles"
        }
    }
}

#Preview {
    ContentView()
}
