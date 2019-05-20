//
//  Globals.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import Foundation
import MBProgressHUD


class Globals {
    
    // MARK: Properties
    static var spinnerActivity : MBProgressHUD?
    static var appdelegate = UIApplication.shared.delegate as! AppDelegate
    static var window : UIWindow  = appdelegate.window!
    
    // MARK: spinner HuD
    class func showHUD() {
        
        DispatchQueue.main.async {
            
            if spinnerActivity == nil {
                spinnerActivity = MBProgressHUD.showAdded(to: window, animated: true);
                spinnerActivity!.isUserInteractionEnabled = false;
                spinnerActivity!.animationType = .zoomOut
                spinnerActivity!.bezelView.color = UIColor.black
                spinnerActivity!.bezelView.backgroundColor = UIColor.black
                spinnerActivity!.backgroundView.color = UIColor(white: 0.3, alpha: 0.4)
                spinnerActivity!.contentColor = UIColor.white
                window.isUserInteractionEnabled = false
            } else {
                spinnerActivity?.show(animated: true)
            }
        }
    }
    
    class func hideHUD() {
        
        DispatchQueue.main.async {
            spinnerActivity?.animationType = .zoomOut
            spinnerActivity?.hide(animated: true)
            spinnerActivity = nil
            // MBProgressHUD.hide(for: Globals.window, animated: true)
            window.isUserInteractionEnabled = true
            
        }
    }
    
    
    //MARK: Alert Controller
    class func showBasicAlert (title:String? , message:String? , vc:UIViewController? ) {
        
        let alertController = UIAlertController(title: title , message: message , preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
        vc?.present(alertController, animated: true, completion: nil)
        
    }
    
}
