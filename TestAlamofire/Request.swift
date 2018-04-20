//
//  Request.swift
//  TestAlamofire
//
//  Created by Olya Tilichenko on 20.04.2018.
//  Copyright © 2018 Olya Tilichenko. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    var delegate: RequestManagerDelegate?
    
    func getRequest(url: URL?) -> () {
        
        if let urlValue = url {
            delegate?.getRequest(url: urlValue)
        }
    }
}

protocol RequestManagerDelegate {
    func getRequest(url: URL)
}

class RequestAlamofireDelegate: RequestManagerDelegate {

    func getRequest(url: URL) {
        
        request(url).validate().responseJSON { responsejs in
            switch responsejs.result {
            case .success(let value):
                guard let videos = Video.getArray(from: value) else { return }
                print(videos)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

class RequestURLSessionDelegate: RequestManagerDelegate {
    
    func getRequest(url: URL) {

        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            guard error == nil else {
                print("error calling GET")
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let value = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [[String: AnyObject]] else {
                        print("error")
                        return
                }
                guard let videos = Video.getArray(from: value) else { return }
                print(videos)
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
}
