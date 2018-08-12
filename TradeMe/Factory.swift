//
//  Factory.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

struct Factory
{
    static func makeActivityIndicator(for view: UIView) -> UIActivityIndicatorView
    {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicator.backgroundColor = UIColor(white: 0.1, alpha: 0.4)
        activityIndicator.tag = -1001
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        activityIndicator.center = view.center
        activityIndicator.color = .white
        activityIndicator.layer.cornerRadius = 20
        return activityIndicator
    }
}

extension Factory
{
    struct TableViewCell
    {
        static func makeCategoryTableViewCell(text: String, in tableView: UITableView) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") ?? UITableViewCell(style: .default, reuseIdentifier: "CategoryCell")
            
            cell.textLabel?.text = text
            cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
        
        static func makeListingCell(listing: Listing, in tableView: UITableView) -> ListingTableViewCell
        {
            let cell: ListingTableViewCell
            
            if let tempCell = tableView.dequeueReusableCell(withIdentifier: ListingTableViewCell.identifier) as? ListingTableViewCell
            {
                cell = tempCell
                cell.listing = listing
            }
            
            else
            {
                cell = ListingTableViewCell(listing: listing)
            }
            
            return cell
        }
    }
}

extension Factory
{
    struct ViewController
    {
        static func makeListingTableViewController(category: Category) -> ListingsTableViewController
        {
            let viewModel: ListingsTableViewModel = ListingsTableViewModel(category: category)
            let vc: ListingsTableViewController = ListingsTableViewController(viewModel: viewModel)
            viewModel.controller = vc
            return vc
        }
        
        static func makeCategoryListViewController() -> CategoryListViewController
        {
            let viewModel: CategoryListViewModel = CategoryListViewModel()
            let categoryListVC: CategoryListViewController = CategoryListViewController(viewModel: viewModel)
            viewModel.controller = categoryListVC
            return categoryListVC
        }
        
        static func makeInitialViewController() -> UINavigationController
        {
            let listVC = self.makeCategoryListViewController()
            let nvc = UINavigationController(rootViewController: listVC)
            nvc.navigationBar.prefersLargeTitles = true
            return nvc
        }
        
        static func makeInitialSplitViewController() -> UISplitViewController
        {
            let splitViewController = UISplitViewController()
            splitViewController.preferredDisplayMode = .allVisible
            
            let initialViewController = Factory.ViewController.makeInitialViewController()
            
            splitViewController.viewControllers = [initialViewController]
            
            return splitViewController
        }
    }
}
