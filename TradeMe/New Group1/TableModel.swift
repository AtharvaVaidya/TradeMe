//
//  TableModel.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

struct TableModel<T>: TableModelProtocol
{
    typealias Data = T
    
    var data: [T] = []
    
    init(data: [T])
    {
        self.data = data
    }
    
    init() {}
}

typealias CategoriesListModel = TableModel<Category>
typealias ListingsTableModel = TableModel<Listing>
