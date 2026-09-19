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
    var isLoading: Bool = true
    var errorMessage: String?
    
    private let apiKey = "046876cd9b9646c6a2170044261909"
}
