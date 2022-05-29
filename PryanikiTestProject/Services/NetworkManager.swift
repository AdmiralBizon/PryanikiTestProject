//
//  NetworkManager.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from urlString: String, with completionHandler: @escaping (RulesList) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("Invalid data")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(RulesList.self, from: data)
                completionHandler(decodedData)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func fetchImage(from url: String?, with completionHandler: @escaping (Data) -> Void) {
        guard let stringURL = url else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let imageData = data {
                completionHandler(imageData)
            }
            
        }.resume()
        
    }
    
}
