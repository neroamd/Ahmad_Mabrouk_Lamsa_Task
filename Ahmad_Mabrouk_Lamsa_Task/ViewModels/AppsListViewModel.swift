//
//  AppsListViewModel.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import Foundation
import UIKit

class AppsListViewModel : NSObject, UITableViewDelegate {
    
    // MARK: Properties
    var appsArray = [Result]()
    var dataSource :TableViewDataSource<AppItemTableViewCell, Result>!
    var callback : ((Result)->())?
    
    
    //MARK: Web Requests
    func getAppsFromAPI(tableView:UITableView) {
        
        if NetworkStatus.sharedInstance.isConnected {
            Globals.showHUD()
            MoyaNetworking.provider.request(.IphoneApps) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let response):
                    Globals.hideHUD()
                    
                    let parsedResponse = try! response.map(IphoneApps.self)
                    if let array = parsedResponse.feed?.results {
                        
                        self.appsArray = array
                        self.updateDataSource(tableView: tableView)
                    }
                case .failure:
                    print("Response Error...")
                    // here to present the error to the user
                }
            }
        } else {
            print("No internet connection")
        }
    }
    
    //MARK: Register Cell
    func registerTableView(tableView:UITableView) {
        tableView.register(AppItemTableViewCell.self)
    }
    
    
    //MARK: TableView Methods
    func updateDataSource(tableView:UITableView) {
        self.dataSource = TableViewDataSource(cellIdentifier: Constants.Cells.applicationItemCellId, items:
        self.appsArray) { cell, obj in
            cell.setupCell(withAppData: obj)
        }
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self
        tableView.reloadData()
    }
    
    // MARK: UITableView Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let appItem =  appsArray[indexPath.row]
        self.callback?(appItem)
        
    }
}

