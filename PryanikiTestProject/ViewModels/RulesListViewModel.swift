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
    
    var bindRulesListViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        fetchData()
    }

    func fetchData() {
        NetworkManager.shared.fetchData(from: K.rulesListAPI) { [weak self] receivedData in
            
            let allElements = receivedData.view.compactMap { elementType in
                receivedData.data.first { $0.name == elementType }
            }
            
            self?.data = allElements
            
        }
    }
    
}
