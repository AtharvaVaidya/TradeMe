//
//  CategoryMasterTableViewController.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

class CategoryListViewController: UITableViewController
{
    var viewModel: CategoryListViewModel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupTableView()
        
        self.title = viewModel.title
    }
    
    init(viewModel: CategoryListViewModel)
    {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
    
    func setupTableView()
    {
        self.tableView?.delegate = viewModel
        self.tableView?.dataSource = viewModel
        self.tableView?.backgroundColor = .white
        self.tableView.separatorInset = .zero
    }
}
