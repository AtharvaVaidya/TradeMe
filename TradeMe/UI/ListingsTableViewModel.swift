//
//  ListingsTableViewModel.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 12/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

class ListingsTableViewModel: NSObject, ImageDownloader
{
    var model: ListingsTableModel = ListingsTableModel()
    var controller: ListingsTableViewController?
    {
        didSet
        {
            if isLoadingData
            {
                controller?.showLoadingIndicator()
            }
        }
    }
    
    let getListingsOperation: SearchCategoryOperation
    
    public var title: String
    {
        get
        {
            return self.category.name
        }
    }
    
    private var isLoadingData: Bool = false
    private let category: Category
    

    init(category: Category)
    {
        self.category = category
        self.getListingsOperation = SearchCategoryOperation(categoryID: category.number)
        
        super.init()
        
        loadData()
    }
    
    func loadData()
    {
        if isLoadingData { return }
        
        isLoadingData = true
        
        self.controller?.showLoadingIndicator()
        getListingsOperation.execute(
        { (listings) in
            self.updateModelAndUI(listings: listings)
            self.controller?.hideLoadingIndicator()
        })
        { (error) in
            print(error.localizedDescription)
            self.controller?.hideLoadingIndicator()
        }
    }
    
    func updateModelAndUI(listings: [Listing])
    {
        DispatchQueue.main.async
        {
            let startingIndex = self.model.data.count - listings.count
            let indicesArr = Array(startingIndex..<self.model.data.count)
            let indices = indicesArr.map({ IndexPath(row: $0, section: 0) })
            
            self.model.data.append(contentsOf: listings)
            
            self.controller?.tableView.beginUpdates()
            self.controller?.tableView.insertRows(at: indices, with: .automatic)
            self.controller?.tableView.endUpdates()
        }
    }
}

extension ListingsTableViewModel: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
}

extension ListingsTableViewModel: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.model.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let listing = model.data[indexPath.row]
        
        let cell = Factory.TableViewCell.makeListingCell(listing: listing, in: tableView)
        
        self.downloadImage(for: listing, cell: cell)
        
        return cell
    }
}
