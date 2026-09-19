//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Manyuchi, Carrington C on 2026/09/19.
//

import Foundation

@Observable
class WeatherViewModel {
    var city = ""
    var weather: WeatherResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let apiKey = "046876cd9b9646c6a2170044261909"
 
    private func fetchWeather(for city: String) async throws -> WeatherResponse {
        let urlString = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
    
        return .init(
            location: .init(name: "London", country: "England"),
            current: .init(
                tempC: 30,
                condition: .init(text: "Great Condition", icon: "Icon Name"),
                feelslikeC: 32
            )
        )
    }
}


