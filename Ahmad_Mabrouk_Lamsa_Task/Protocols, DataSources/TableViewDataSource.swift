//
//  TableViewDataSource.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<Cell :UITableViewCell,Model> : NSObject, UITableViewDataSource  {
    
    private var cellIdentifier :String!
    private var items :[Model]!
    var configureCell :(Cell,Model) -> ()
    
    init(cellIdentifier :String, items :[Model], configureCell: @escaping (Cell,Model) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    
    // MARK:- UItableView Data sources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
}
