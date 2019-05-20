//
//  Reachability.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import Foundation
import Alamofire


class NetworkStatus {
    static let sharedInstance = NetworkStatus()
    
    typealias callback = (NetworkReachabilityManager.NetworkReachabilityStatus) -> Void
    
    private init() {}
    
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
    
    func startNetworkReachabilityObserver(completionHandler : @escaping callback) {
        reachabilityManager?.listener = { status in
            
            switch status {
                
            case .notReachable:
                print("The network is not reachable")
                
            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            }
            completionHandler(status)
        }
        reachabilityManager?.startListening()
    }
    
    var isConnected: Bool {
        // isReachable checks for wwan, ethernet, and wifi, if
        // you only want 1 or 2 of these, the change the .isReachable
        // at the end to one of the other options.
        return (reachabilityManager?.isReachable)!
    }
}
