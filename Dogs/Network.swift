//
//  Network.swift
//  Dogs
//
//  Created by Oleg Starkin on 12/6/20.
//

import UIKit

class Network {
    
    static func fetchDataImage(completion: @escaping (Dog) -> ()) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {return}
                
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data else {
                return
            }
            
            guard let randomDogImage = try? JSONDecoder().decode(Dog.self, from: data) else {
                return
            }
            completion(randomDogImage)
        }
        .resume()
    }
    
    static func fetchImage(url: String) -> UIImage? {
        guard let imageUrl = URL(string: url) else {return nil}
        guard let imageData = try? Data(contentsOf: imageUrl) else {return nil}
        let image = UIImage(data: imageData)
        return image
    }
}
