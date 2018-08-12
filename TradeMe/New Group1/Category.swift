//
//  Category.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 10/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

struct Category: Codable
{
    let name: String
    let number: String
    let path: String
    let hasClassifields: Bool?
    let canHaveSecondCategory: Bool?
    let canBeSecondCategory: Bool?
    let isLeaf: Bool
    
    enum CodingKeys: String, CodingKey
    {
        case name = "Name"
        case number = "Number"
        case path = "Path"
        case hasClassifields = "HasClassifieds"
        case canHaveSecondCategory = "CanHaveSecondCategory"
        case canBeSecondCategory = "CanBeSecondCategory"
        case isLeaf = "IsLeaf"
    }
}
