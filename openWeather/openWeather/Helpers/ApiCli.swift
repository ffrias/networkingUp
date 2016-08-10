//
//  ApiCli.swift
//  openWeather
//
//  Created by Federico Frias on 8/9/16.
//  Copyright © 2016 ffrias. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class APICli{
    
    static let sharedInstance = APICli()
    private init(){}
    
    func getDataWeather(base_url:String, resource: String, params:[String:String],completion:(result:JSON)->Void){
        
        Alamofire.request(.GET, base_url+resource, parameters: params)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let data = response.result.value {
                        let json = JSON(data)
                        completion(result:json)
                    }
                case .Failure(let error):
                    completion(result: JSON("Error: \(error)"))
                }
        }
    }
}
