//
//  WeatherView.swift
//  Weather App
//
//  Created by Manyuchi, Carrington C on 2026/09/19.
//

import SwiftUI

struct WeatherView: View {
    @State private var vm: WeatherViewModel = WeatherViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter city name", text: $vm.city)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    
                    // TODO: Fetch Weather from VM
                    
                } label: {
                    Label("Get Weather", systemImage: "cloud.sun.fill")
                }
                .buttonStyle(.borderedProminent)
                .padding()

                if vm.isLoading {
                    ProgressView("Fetching Weather...")
                        .padding()
                } else if let weather = vm.weather {
                    
                    // TODO: Implement weather card
                    
                    Text("display weather card")
                } else if let errorMessage = vm.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                }
                
                Spacer()
                
            }
            .navigationTitle("Weather App")
            .padding()
        }
    }
}

#Preview {
    WeatherView()
}
