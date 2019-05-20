//
//  MoyaNetworking.swift
//  Ahmad_Mabrouk_Lamsa_Task
//
//  Created by Ahmad Mabrouk on 5/20/19.
//  Copyright © 2019 Ahmad Mabrouk. All rights reserved.
//

import Foundation
import Moya

public enum MoyaNetworking {
    
    static let provider = MoyaProvider<MoyaNetworking>()
    static private let privateKey = "YOUR PRIVATE KEY"
    static private let publicKey = "YOUR PUBLIC KEY"
    
    case IphoneApps
}

extension MoyaNetworking: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://rss.itunes.apple.com/api/")!
    }
    
    public var path: String {
        switch self {
        case .IphoneApps: return "v1/jo/ios-apps/top-free/all/50/explicit.json"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .IphoneApps: return .get
        }
    }
    
    public var sampleData: Data {
        return Data() // we only return Data() here as a fake response, it has to be changed for Unit Testing.
    }
    
    public var task: Task {
        
        //let ts = "\(Date().timeIntervalSince1970)"
        //let hash = (ts + Motory.privateKey + Motory.publicKey).md5 //md5 will be replaced by something else like (sha1 or sha256)
        
        //let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash]
        
        switch self {
            
        case .IphoneApps:
            return.requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
