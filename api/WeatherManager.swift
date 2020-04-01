//
//  WeatherManager.swift
//  api
//
//  Created by Cátia Souza on 31/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
}
struct WeatherManager{
    let weatherURL = "https://swapi.co/api/films"
    
    var delegate: WeatherManagerDelegate?
    
    func feathWeater(people: String){
        let urlNumber = "\(weatherURL)/\(people)/"
        perfomRequest(urlString: urlNumber)
    }
    func perfomRequest(urlString: String){
        if  let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error)
                    return
                }
                if let safeData = data{
                    if let weather =  self.parseJson( safeData){
                         self.delegate?.didUpdateWeather( self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJson(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do{
            let decoderData =  try  decoder.decode(DataModel.self, from: weatherData)
            let id =  decoderData.episode_id
            let titulo = decoderData.title
            let opening = decoderData.opening_crawl
            let weather = WeatherModel(episode_id: id, titulo: titulo, opening: opening)
            return weather
            
        }catch{
            print(error)
            return nil
        }
    }
}
