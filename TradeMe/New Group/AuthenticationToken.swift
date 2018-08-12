//
//  AuthenticationToken.swift
//  Heroes
//
//  Created by Atharva Vaidya on 16/07/18.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

public struct AuthenticationToken
{
    let timestamp: String
    let publicKey: String = Constants.consumerKey
    private let privateKey: String = Constants.consumerSecret
    
    init(timestamp: TimeInterval)
    {
        self.timestamp = "\(Int(timestamp))"
    }
    
    init()
    {
        self.init(timestamp: Date().timeIntervalSince1970)
    }
}
