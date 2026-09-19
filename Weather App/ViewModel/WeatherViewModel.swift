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
        
         //MARK: - Build URL
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
        guard let url = URL(string: urlString) else {
            throw WeatherError.invalidURL
        }
        
         //MARK: - Fetch Data
        let (data, response) = try await URLSession.shared.data(from: url)
        
         //MARK: - Validate Response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherError.unknown
        }
        
        guard httpResponse.statusCode == 200 else {
            throw WeatherError.requestFailed(statusCode: httpResponse.statusCode)
        }
        
         //MARK: - Decode Model
        
        do {
            return try JSONDecoder().decode(WeatherResponse.self, from: data)
        } catch {
            throw WeatherError.decodingFailed
        }
 
    }
    
    
    @MainActor
    func fetch() async throws {
        do {
            weather = try await fetchWeather(for: city)
            errorMessage = "Successfully fetched weather for \(city.capitalized)"
        } catch {
            if let weatherError = error as? WeatherError {
                errorMessage = weatherError.localizedDescription
            } else {
                errorMessage = "unexpected error: \(error.localizedDescription)"
            }
        }
    }
}


