//
//  UIImageView+Extension.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/8/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class URLImageView: UIImageView {
    
    var imageUrlString: String = ""
    
    func loadImageWithUrl(url: String?) {
        
        guard let urlString = url else {
            //set broken image
            return;
        }
        
        imageUrlString = urlString
        self.image = nil
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.center
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
        
        if let cachedImage = ImageCache.shared.getImage(with: imageUrlString) {
            DispatchQueue.main.async {
                self.image = cachedImage
                activityIndicator.stopAnimating()
                return
            }
        }
        
        NetworkService.shared.loadData(with: urlString) { (data, error) in
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                guard let data = data, error == nil else {
                    self.image = UIImage()
                    return
                }
                let fetchedImage = UIImage(data: data)
                
                if self.imageUrlString == urlString {
                    self.image = fetchedImage
                }

                ImageCache.shared.saveImage(with: self.imageUrlString, fetchedImage!)
            }
        }
    }
}
