//
//  ListingsParser.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 12/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

public class ListingsParser: Parser<[Listing]>
{
    public override func parse(data: Data) throws -> [Listing]
    {
        do
        {
            guard let dictObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary,
                let results = dictObject["List"] as? [NSDictionary]
                else
            {
                return Array<Listing>()
            }
            
            let parsedresults: [Listing] = results.compactMap({ self.parse(from: $0) })
            
            return parsedresults
        }
            
        catch
        {
            throw NetworkError.failedToParseJSONData(data)
        }
    }
}
