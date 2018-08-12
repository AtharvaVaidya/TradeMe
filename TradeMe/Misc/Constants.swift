//
//  Constants.swift
//  Movies
//
//  Created by Atharva Vaidya on 14/07/18.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

public struct Constants
{
    static let consumerKey:     String = "A1AC63F0332A131A78FAC304D007E7D1"
    static let consumerSecret:  String = "EC7F18B17A062962C6930A8AE88B16C7"
    
    static let listingImageCache: NSCache<NSString, UIImage> =
    {
        let cache = NSCache<NSString, UIImage>()
        cache.name = "Listing Image Cache"
        return cache
    }()
    
    struct Images
    {
        static let favorite: UIImage =
        {
            return UIImage(named: "favorite") ?? UIImage()
        }()
        
        static let favoriteFilled: UIImage =
        {
            return UIImage(named: "favorite_filled") ?? UIImage()
        }()
    }
    
    private init() {}
}
