//
//  NetworkManager.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, with completionHandler: @escaping (RulesList) -> Void) {
        
        AF.request(url)
            .validate()
            .responseDecodable(of: RulesList.self) { response in
                switch response.result {
                case .success(let receivedData):
                    completionHandler(receivedData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}
