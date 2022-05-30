//
//  ImageTableViewCell.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import UIKit
import Kingfisher

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemText: UILabel!
    
    private var downloadTask: DownloadTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemImage.image = nil
        itemImage.kf.cancelDownloadTask()
    }
    
    func configureCell(for element: ElementData) {
        
        itemText.text = element.text
        
        if let urlString = element.url, let imageURL = URL(string: urlString) {
            itemImage.kf.setImage(with: imageURL)
        }
    }
}
