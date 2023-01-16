//
//  PlaneCell.swift
//  AstronomyPhotos
//
//  Created by Brendon Crowe on 1/16/23.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    @IBOutlet weak var planetImageView: UIImageView!
    
    
    // objective: stop flickering while dequeuing reusable cells
    // solution: keep track of the image url string by using a string variable for the cell
    
    private var urlString = ""
    
    
    func configureCell(with urlString: String) {
        // set the cell's urlString
        self.urlString = urlString
        
        planetImageView.getImage(with: urlString) { result in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self.planetImageView.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    
                    // only if the cell's urlString is the same as the one being passed in from the cellForRowAt will the current image view's image change
                    if self.urlString == urlString {
                        self.planetImageView.image = image
                    }
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // empty out the image view; set it to nil
        planetImageView.image = nil
        
    }
}

