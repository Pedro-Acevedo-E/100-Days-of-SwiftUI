//
//  ContentView.swift
//  BetterRest
//
//  Created by Pedro Acevedo on 19/03/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    private var recomendedBedtime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Int64(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Int64(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    HStack () {
                        Spacer()
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                        Spacer()
                    }
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section(header: Text("Daily coffee intake")) {
                    /*
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                    
                    */
                    
                    Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cup(s)", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text(String($0))
                        }
                    }
                }
                
                Section(header: Text("Your ideal bedtime is...")) {
                    Text(recomendedBedtime)
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            .navigationTitle("BetterRest")
            /*
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
             */
        }
    }
    
    //Another way to calculate bedtime...
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Int64(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Int64(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
