//
//  AppsListViewController.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import UIKit

class AppsListViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = AppsListViewModel()
    var indexPath = IndexPath()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }
    
    //MARK: Interface
    func updateUI() {
        
        self.viewModel.getAppsFromAPI(tableView: self.tableView)
        self.viewModel.registerTableView(tableView: self.tableView)
        self.tableView.rowHeight = viewModel.tableView(tableView, heightForRowAt: indexPath)
        
         //Handle callbacks from view model (didSelectRowAt)
        viewModel.callback = { [weak self] appObj in
            let vc  = self?.storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoardIDs.appDetailsViewController) as! AppDetailsViewController
            
            //inject View Model into App details VC
            vc.viewModel = AppDetailsViewModel()
            vc.viewModel.appItem = appObj
            self?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    }
    
}
