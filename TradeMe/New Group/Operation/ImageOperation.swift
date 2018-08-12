//
//  ImageOperation.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 12/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

/// An operation to download a poster from the API
class DownloadImage: NetworkOperation<UIImage>
{
    let path: String
    
    /// Initializes the GetPoster Operation with the given thumbnail path
    ///
    /// - Parameters:
    ///   - thumbnail: The thumbnail object that contains the path for the image to be downloaded
    ///   - imageType: The size of the image that should be downloaded. Default if `medium`
    init(pictureHref: String)
    {
        self.path = pictureHref
        
        guard let url = URL(string: self.path)
            else
        {
            fatalError("could not construct base url for image")
        }
        
        let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.scheme = "https"
        
        guard let secureURL = components?.url else
        {
            fatalError("Unable to create https version of request")
        }
        
        let serviceConfig = ServiceConfig(base: secureURL)
        
        let request =  Request(method: .get, endpoint: "", authenticationRequired: false)
        
        super.init(request: request, serviceConfig: serviceConfig)
    }
    
    override func parser() -> Parser<UIImage>
    {
        return ImageParser()
    }
}
