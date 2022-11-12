//
//  CardImageView.swift
//  AF_test
//
//  Created by Maxim Mitin on 12.11.22.
//

import UIKit

class CardImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            print(url)
            return}
        
        //use from cache
        if let cachedImage = getCachedImage(from: imageURL) {
            image = cachedImage
            return
        }
        
        //load image
        ImageManager.shared.fetchImage(from: imageURL) { data, response in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                
            }
            //Save image to cache
            self.saveDataToCache(with: data, and: response)
        }
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let urlResponse = response.url else {return}
        let request = URLRequest(url: urlResponse)
        
        let cacheResponse = CachedURLResponse(response: response, data: data)
        
        URLCache.shared.storeCachedResponse(cacheResponse, for: request)
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}
