//
//  AppItemTableViewCell.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import UIKit
import Kingfisher

class AppItemTableViewCell: TableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblAppTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK : - Cell Configuration
    func setupCell(withAppData app: Result) {
        
        self.lblAppTitle.text = app.name
        
        self.imgView.kf.indicatorType = .activity
        self.imgView.kf.setImage(with: URL(string: app.artworkUrl100 ?? ""))
        self.imgView?.layer.cornerRadius = 8
        
    }
    
}
