//
//  SpacexService.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 26.12.21..
//

import UIKit

class ImageHelper {
    
    // MARK: - API
    static let shared = ImageHelper()

    var imageCache = NSCache<NSString, UIImage>()    
}
