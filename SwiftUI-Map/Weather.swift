//
//  Weather.swift
//  SwiftUI-Map
//
//  Created by Ji Wang on 9/13/21.
//
//  ref: https://levelup.gitconnected.com/creating-a-weather-app-using-swiftui-weatherstack-98578a98c621
//
import SwiftUI

struct AirQuality: Codable {
    let usEpaIndex: Int
    let gbDefraIndex: Int
}

struct Condition: Codable {
    let text: String // description of weather, e.g. Partly Cloudy
    let iconURL: String // url of the icon of this weather
}

struct Current: Codable {
    let temp_c: Double // temp in celcius
    let temp_f: Double // temp in fahrenheit
    let condition: [Condition]
    let airQuality: [AirQuality]
}

struct Weather: Codable {
    let current: [Current]
}

func getWeatherData(accesskey: String, latitude: String, longitude: String) {
    let jsonURLString = "http://api.weatherapi.com/v1/current.json?key="+accesskey+"&q="+latitude+","+longitude+"&aqi=yes"
    
    // make url
    guard let url = URL(string: jsonURLString) else { return }
    
    // create a session
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        // check for error
        if error != nil {
            print(error!.localizedDescription)
        }
        
        guard let data = data else { return }
        
        do {
            let weather = try JSONDecoder().decode(Weather.self, from: data)
        } catch let err {
            print("JSON Error", err)
        }
        
    }.resume()
}
