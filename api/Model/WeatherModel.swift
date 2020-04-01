//
//  WeatherModel.swift
//  api
//
//  Created by Cátia Souza on 01/04/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let episode_id: Int
    let titulo:String
    let opening:String
    
    var getFilme: String{
        switch episode_id {
        case 3:
            return "return" // 6 Return of the Jedi
        case 1:
            return "hope"  // 4 A New Hope
        case 2:
            return "empire" //5 The Empire Strikes Back
        case 4:
            return "star"   //1 The Phantom Menace
        case 5:
            return "empireS" // 2The Empire Strikes Back
        case 6:
            return "revenge" //3Revenge of the Sith
        case 7:
            return "force"   // 7The Force Awakens
            
        default:
            return "download"
        }
        
    }
    
    
}
