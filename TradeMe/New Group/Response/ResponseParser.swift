//
//  Parser.swift
//  Movies
//
//  Created by Atharva Vaidya on 14/07/18.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

/// Generic Parser for a given type.
public class Parser<T>
{
    public func parse(data: Data) throws -> T
    {
        throw NetworkError.failedToParseJSONData(data)
    }
    
    public func parse<T: Codable>(from dictionary: NSDictionary) -> T?
    {
        let decoder = JSONDecoder()
        
        return try? decoder.decode(T.self, from: JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.sortedKeys))
    }
}

public class CodableSequenceResponseParser<T: Codable>: Parser<[T]>
{
    public override func parse(data: Data) throws -> [T]
    {
        do
        {
            guard let dictObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary,
                let results = dictObject["Subcategories"] as? [NSDictionary]
            else
            {
                return Array<T>()
            }
            
            let parsedresults: [T] = results.compactMap({ self.parse(from: $0) })
            
            print(parsedresults.map({ ($0 as! Category).number }))
            
            return parsedresults
        }
            
        catch
        {
            throw NetworkError.failedToParseJSONData(data)
        }
    }
}

//public class SequenceElementResponseParser<T: HeroAttributeProtocol>: Parser<[T]>
//{
//    public override func parse(data: Data) throws -> [T]
//    {
//        do
//        {
//            guard let dictObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary,
//                let dataDict = dictObject["data"] as? NSDictionary,
//                let results = dataDict["results"] as? [NSDictionary]
//            else
//            {
//                return Array<T>()
//            }
//            
//            let array: [T] = results.compactMap({ self.parse(from: $0) })
//                        
//            return array
//        }
//            
//        catch
//        {
//            throw NetworkError.failedToParseJSONData(data)
//        }
//    }
//}
