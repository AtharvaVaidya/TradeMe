//
//  CategoryOperation.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

class CategoriesOperation: NetworkOperation<[Category]>
{
    private let endpoint: String
    
    init(categoryNumber: Int = 0, depth: Int = 1)
    {
        self.endpoint = "/Categories/\(categoryNumber).json?depth=\(depth)"
        let request = Request(method: .get, endpoint: endpoint)
        super.init(request: request)
    }
    
    override func parser() -> Parser<[Category]>
    {
        return CategoriesParser()
    }
}
