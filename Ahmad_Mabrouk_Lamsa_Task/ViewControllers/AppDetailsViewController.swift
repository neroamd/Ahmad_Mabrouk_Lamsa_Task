//
//  AppDetailsViewController.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import UIKit
import SKPhotoBrowser


class AppDetailsViewController: BaseViewController {
    
    //MARK: - Properties
    var viewModel: AppDetailsViewModel!
    
    //Images
    @IBOutlet weak var imgApp: UIImageView!
    
    //Labels
    @IBOutlet weak var lblAppName: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblCopyRights: UILabel!
    @IBOutlet weak var lblGenreName: UILabel!
    
    //Buttons
    @IBOutlet weak var btnAppLink: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "App Details"
        updateUI()
    }
    
    
    // MARK: - Interface
    func updateUI() {
        
        self.lblAppName.text = self.viewModel.appItem?.name
        self.lblReleaseDate.text = lblReleaseDate.text! + " " + self.viewModel.appItem!.releaseDate!
        self.lblCopyRights.text = lblCopyRights.text! + " " + self.viewModel.appItem!.copyright!
        
        let genres:[Genre] = viewModel.appItem!.genres!
        var genresArray = [String]()
        for item in genres {
            genresArray.append(item.name ?? "")
        }
        self.lblGenreName.text = genresArray.joined(separator: " , ")
        btnAppLink.layer.cornerRadius = 5

        imgApp?.layer.cornerRadius = 10.0
        imgApp?.layer.masksToBounds = true
        imgApp.kf.indicatorType = .activity
        if let urlString = viewModel.appItem?.artworkUrl100, let url = URL(string: urlString) {
            imgApp.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cachType, url) in
                
                if error == nil {
                    let photo = SKPhoto.photoWithImage(image!)// add some UIImage
                    self.viewModel.appImages.append(photo)
                }
            })
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imagePressed(_:)))
        imgApp.addGestureRecognizer(tapGesture)

    }
    
    
    // MARK: - Tap Gestures Handlers
    @objc func imagePressed(_ sender: UITapGestureRecognizer) {
        
        // 2. create PhotoBrowser Instance, and present from your viewController.
        let browser = SKPhotoBrowser(photos: viewModel.appImages)
        browser.initializePageIndex(0)
        present(browser, animated: true, completion: {})
    }


    // MARK: - Buttons Handlers
    @IBAction func btnAppLinkPressed(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: Constants.StoryBoardIDs.appLinkViewController) as! AppLinkViewController
        vc.url = self.viewModel.appItem?.url ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
