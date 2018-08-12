//
//  TableModelProtocol.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

/// Protocol for the model of a UITableView.
public protocol TableModelProtocol
{
    associatedtype Data
    
    var data: [Data] { get set }
}
