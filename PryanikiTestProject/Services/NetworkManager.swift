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
    
    func fetchData(from url: String, with completionHandler: @escaping (Result<RulesList, AFError>) -> Void) {
        
        AF.request(url)
            .validate()
            .responseDecodable(of: RulesList.self) { response in
                completionHandler(response.result)
            }
    }
    
}
