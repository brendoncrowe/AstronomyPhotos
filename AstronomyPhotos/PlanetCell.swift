//
//  PlaneCell.swift
//  AstronomyPhotos
//
//  Created by Brendon Crowe on 1/16/23.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    @IBOutlet weak var planetImageView: UIImageView!
    
    func configureCell(with urlString: String) {
        
        planetImageView.getImage(with: urlString) { result in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self.planetImageView.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.planetImageView.image = image
                }
            }
        }
    }
}

