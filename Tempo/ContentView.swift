//
//  ContentView.swift
//  Tempo
//
//  Created by Lexi McQueen on 7/23/23.
//

import SwiftUI

enum ConversionType: String, CaseIterable, Identifiable {
    case Fahrenheit, Celsius
    
    var id: Self { self }
}

struct ContentView: View {
    @State private var inputTemperature = 60
    @State private var selectedConversion : ConversionType = .Fahrenheit
    
    var convertedFahrenheitTemperature: Double {
        let fahrenheitTemperature = (Double(inputTemperature) - 32.0) / 1.8
        return fahrenheitTemperature
    }
    
    var convertedCelsuisTemperature: Double {
        let celsiusTemperature = (Double(inputTemperature) * 1.8) + 32.0
        return celsiusTemperature
    }
    
    var body: some View {
        NavigationView {
            Form {

                Section {
                    Picker("Choose a Unit:", selection: $selectedConversion) {
                        Text("Fahrenheit").tag(ConversionType.Fahrenheit)
                        Text("Celsuis").tag(ConversionType.Celsius)
                    }
                }
                
                Section {
                    TextField("Amount: ", value: $inputTemperature, format: .number)
                } header: {
                    if selectedConversion == .Celsius {
                        Text("Input Celsius Temperature")
                    }
                    Text("Input Fahrenheit Temperature")

                }
                
                Section {
                    if selectedConversion == .Celsius {
                        Text(convertedCelsuisTemperature, format: .number)
                    } else {
                        Text(convertedFahrenheitTemperature, format: .number)
                    }
                } header: {
                    Text("Converted Temperature")
                }
            }
            .navigationTitle("Temp Convert")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
