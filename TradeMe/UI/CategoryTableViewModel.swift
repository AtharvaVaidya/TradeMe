//
//  CategoryTableViewModel.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

class CategoryListViewModel: NSObject
{
    var model: CategoriesListModel = CategoriesListModel()
    public var controller: CategoryListViewController?
    {
        didSet
        {
            if isLoadingData
            {
                controller?.showLoadingIndicator()
            }
        }
    }
    
    let getCategoriesOperation: CategoriesOperation = CategoriesOperation()
    
    public let title: String = "Categories"
    
    private var isLoadingData: Bool = false
    
    override init()
    {
        super.init()
        
        loadData()
    }
    
    func loadData()
    {
        if isLoadingData { return }
        
        isLoadingData = true
        
        self.controller?.showLoadingIndicator()
        getCategoriesOperation.execute(
        { (categories) in
            self.updateModelAndUI(categories: categories)
            self.controller?.hideLoadingIndicator()
        })
        { (error) in
            print(error.localizedDescription)
            self.controller?.hideLoadingIndicator()
        }
    }
    
    func updateModelAndUI(categories: [Category])
    {
        DispatchQueue.main.async
        {
            let startingIndex = self.model.data.count - categories.count
            let indicesArr = Array(startingIndex..<self.model.data.count)
            let indices = indicesArr.map({ IndexPath(row: $0, section: 0) })
            
            self.model.data.append(contentsOf: categories)
            
            self.controller?.tableView.beginUpdates()
            self.controller?.tableView.insertRows(at: indices, with: .automatic)
            self.controller?.tableView.endUpdates()
        }
    }
}


extension CategoryListViewModel: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let category: Category = self.model.data[indexPath.row]
        
        let vc = Factory.ViewController.makeListingTableViewController(category: category)
                
        let nvc = UINavigationController(rootViewController: vc)
        nvc.navigationBar.prefersLargeTitles = false
        
        controller?.splitViewController?.showDetailViewController(nvc, sender: nil)
    }
}

extension CategoryListViewModel: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return model.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let categoryName = model.data[indexPath.row].name
        return Factory.TableViewCell.makeCategoryTableViewCell(text: categoryName, in: tableView)
    }
}
