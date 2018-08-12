//
//  ListingsTableViewController.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 12/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

class ListingsTableViewController: UITableViewController
{
    var viewModel: ListingsTableViewModel
    
    init(viewModel: ListingsTableViewModel)
    {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupTableView()
        
        self.title = viewModel.title
    }
    
    func setupTableView()
    {
        self.tableView?.delegate = viewModel
        self.tableView?.dataSource = viewModel
        self.tableView?.backgroundColor = .white
        self.tableView.separatorInset = .zero
        self.tableView?.allowsSelection = false
    }
}
