//
//  ViewController.swift
//  api
//
//  Created by Cátia Souza on 31/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,WeatherManagerDelegate {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var texto: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    var weatManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatManager.delegate = self
        textField.delegate = self
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let pessoa = textField.text{
            weatManager.feathWeater(people: pessoa)
        }
    }
    
    @IBAction func buton(_ sender: Any) {
        if let pessoa = textField.text{
            weatManager.feathWeater(people: pessoa)
            print(pessoa)
        }
    }
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.titulo.text = weather.titulo
            self.texto.text = weather.opening
            self.image.image = UIImage(named: weather.getFilme)
        }
        print(weather.titulo)
    }
}

