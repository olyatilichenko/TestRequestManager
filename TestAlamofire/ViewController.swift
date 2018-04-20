//
//  ViewController.swift
//  TestAlamofire
//
//  Created by Olya Tilichenko on 20.04.2018.
//  Copyright © 2018 Olya Tilichenko. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestManager = RequestManager()
        
        let requestAlamofireDelegate = RequestAlamofireDelegate()
        requestManager.delegate = requestAlamofireDelegate
        
        //let requestURLSessionDelegate = RequestURLSessionDelegate()
        //requestManager.delegate = requestURLSessionDelegate
        
        let urlString = "https://swift.mrgott.pro/blog.json"
        let url = URL(string: urlString)
        
        requestManager.getRequest(url: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

