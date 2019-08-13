//
//  UIImageExtensions.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 24/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

extension UIImage {
    static func load(from url: String, completion: @escaping API.RequestImageResult) {
        
        guard let url = URL(string: "\(API.baseImageUrl)\(APIEndpoint.ImageSize.w300)\(url)") else {
            completion(.failure(.invalidData))
            return
        }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    completion(.failure(.invalidData))
                    return
                }
                
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            } catch {
                completion(.failure(.invalidData))
            }
        }
    }
}
