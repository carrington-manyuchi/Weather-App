//
//  WeatherCard.swift
//  Weather App
//
//  Created by Manyuchi, Carrington C on 2026/09/19.
//

import SwiftUI

struct WeatherCard: View {
    let weather: WeatherResponse
    var urlString: String {
        "\(weather.current.condition.icon)"
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            
            Text("\(weather.location.name), \(weather.location.country)")
                .font(.title2)
                .bold()
            
            Text("\(weather.current.tempC, specifier: "%.1f")")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            
            Text(weather.current.condition.text)
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))
            
            Text("Feels like \(weather.current.feelslikeC, specifier: "%.1f")")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [.blue, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
        .padding()
    }
}


extension WeatherResponse {
    static let sample = WeatherResponse(
        location: Location(
            name: "Harare",
            country: "Zimbabwe"
        ),
        current: Current(
            tempC: 25.5,
            condition: Condition(
                text: "Sunny",
                icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
            ), feelslikeC: 4
        )
    )
}

#Preview {
    WeatherCard(weather: .sample)
}
