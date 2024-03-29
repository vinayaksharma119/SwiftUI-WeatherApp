//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Vinayak Sharma on 15/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Jaipur RJ")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : dayImageName.cloudSunFill, temperature: 35)
                
                HStack(spacing: 20) {
                    
                    WeatherDayView(dayOfWeek: daysOfWeek.tuesday, imageName: dayImageName.cloudSunFill, temperature: 34)
                    
                    WeatherDayView(dayOfWeek: daysOfWeek.wednesday, imageName: dayImageName.sunMaxFill, temperature: 37)
                    
                    WeatherDayView(dayOfWeek: daysOfWeek.thursday, imageName: dayImageName.windSnow, temperature: 0)
                    
                    WeatherDayView(dayOfWeek: daysOfWeek.friday, imageName: dayImageName.sunsetFill, temperature: 34)
                    
                    WeatherDayView(dayOfWeek: daysOfWeek.saturday, imageName: dayImageName.snow, temperature: -12)
                    
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16).weight(.medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28).weight(.medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32).weight(.medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70).weight(.medium))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 40)
    }
}

