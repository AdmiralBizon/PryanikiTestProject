//
//  ImageTableViewCell.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemText: UILabel!
    
    func configureCell(for element: ElementData) {
        
        itemText.text = element.text
        
        NetworkManager.shared.fetchImage(from: element.url) { imageData in
            DispatchQueue.main.async {
                self.itemImage.image = UIImage(data: imageData)
            }
        }
    }
}
