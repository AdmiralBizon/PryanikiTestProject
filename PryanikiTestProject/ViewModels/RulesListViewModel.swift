//
//  RulesListViewModel.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import Foundation

class RulesListViewModel: NSObject {
    
    private(set) var data = [Element]() {
        didSet {
            self.bindRulesListViewModelToController()
        }
    }
    
    var errorDescription: String?
    var bindRulesListViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        fetchData()
    }
    
    func fetchData() {
        NetworkManager.shared.fetchData(from: K.rulesListAPI) { [weak self] response in
            switch response {
            case .success(let receivedData):
                let allElements = receivedData.view.compactMap { elementType in
                    receivedData.data.first { $0.name == elementType }
                }
                self?.data = allElements
                self?.errorDescription = nil
            case .failure(let error):
                self?.errorDescription = error.localizedDescription
                self?.bindRulesListViewModelToController()
            }
        }
    }
}
