//
//  WeatherError.swift
//  Weather App
//
//  Created by Manyuchi, Carrington C on 2026/09/19.
//


import Foundation

enum WeatherError: LocalizedError {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided city name is invalid"
        case .requestFailed(statusCode: let statusCode):
            return "Request failed with status code: \(statusCode). Please try again."
        case .decodingFailed:
            return "Failed to decode weather data. The server may have changed its response format. "
        case .unknown:
            return "An unknown error occurred"
        }
    }
}
