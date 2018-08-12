//
//  SearchCategoryOperation.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

//https://api.tmsandbox.co.nz/v1/Search/General.json

class SearchCategoryOperation: NetworkOperation<[Listing]>
{
    let endpoint: String
    
    init(categoryID: String)
    {
        self.endpoint = "/Search/General.json?category=\(categoryID)"
        let request = Request(method: .get, endpoint: endpoint, params: nil, headers: ["Authorization" : "OAuth oauth_consumer_key=\"\(Constants.consumerKey)\", oauth_signature_method=\"PLAINTEXT\", oauth_signature=\"\(Constants.consumerSecret)&\"", "Content-Type" : "application/x-www-form-urlencoded"], fields: nil, body: nil, page: nil, authenticationRequired: true)
        super.init(request: request)
    }
    
    override func parser() -> Parser<[Listing]>
    {
        return ListingsParser()
    }
}
