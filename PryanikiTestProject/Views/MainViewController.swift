//
//  MainViewController.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = RulesListViewModel()
    private var items = [Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callViewModelForUIUpdate()
    }

    func callViewModelForUIUpdate() {
        viewModel.bindRulesListViewModelToController = {
            self.updateUI()
        }
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.items = self.viewModel.data
            self.tableView.reloadData()
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
       
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }

}

// MARK: - TableViewDelegate, TableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentElement = items[indexPath.row]
        
        if currentElement.name == "selector" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: K.selectorCellIdentifier, for: indexPath) as! SelectorTableViewCell
            cell.configureCell(for: currentElement.data)
            
            return cell
        
        } else if currentElement.name == "picture"  {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: K.imageCellIdentifier, for: indexPath) as! ImageTableViewCell
            cell.configureCell(for: currentElement.data)
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: K.textCellIdentifier, for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            content.text = currentElement.data.text
            cell.contentConfiguration = content
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlert(message: "Выбран элемент \(items[indexPath.row].name)")
    }
    
}

