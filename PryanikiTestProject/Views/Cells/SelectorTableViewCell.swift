//
//  SelectorTableViewCell.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selector: UISegmentedControl!
    @IBOutlet weak var selectedItemLabel: UILabel!
    
    private var variantDetails = [Int: String]()
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        selectedItemLabel.text = variantDetails[sender.selectedSegmentIndex]
    }
    
    func configureCell(for content: ElementData) {

        if let variants = content.variants {
            selector.removeAllSegments()
            
            variants.forEach { variant in
                
                let index = variant.id > 0 ? variant.id - 1 : 0
                
                selector.insertSegment(withTitle: String(variant.id), at: index, animated: true)
                if variant.id == content.selectedId! {
                    selector.selectedSegmentIndex = index
                    selectedItemLabel.text = variant.text
                }
                
                variantDetails[index] = variant.text

            }
        }
    }
}
