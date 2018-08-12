//
//  MovieTableViewCellPosterDownloader.swift
//  Movies
//
//  Created by Atharva Vaidya on 15/07/18.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

///// Protocol that be should adhered to if the object wants to download a movie poster for a given `MovieTableViewCell`
protocol ImageDownloader
{
    func downloadImage(for listing: Listing, cell: ListingTableViewCell)
    
//    func downloadImage(for hero: Listing, imageView: UIImageView, _ completion: (() -> ())?)
}


extension ImageDownloader
{
    func downloadImage(for listing: Listing, cell: ListingTableViewCell)
    {
        guard let pictureHref = listing.pictureHref else { return }
        if let cachedImage = Constants.listingImageCache.object(forKey: pictureHref as NSString)
        {
            cell.update(image: cachedImage)
        }
            
        else
        {
            DownloadImage(pictureHref: pictureHref).execute(
            { (image) in
                
                Constants.listingImageCache.setObject(image, forKey: pictureHref as NSString)
                
                if cell.listing == listing
                {
                    DispatchQueue.main.async
                    {
                        cell.update(image: image)
                    }
                }
                
            })
            { (error) in
                print(error)
            }
        }
    }
}
