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
        request("https://swift.mrgott.pro/blog.json").validate().responseJSON { responsejs in
            switch responsejs.result {
            case .success(let value):
                print(value)
                
                guard let jsonArray = responsejs.result.value as? [[String: Any]] else { return }
                print("array: ", jsonArray)
                print("one object: ", jsonArray[0])
                print("date: ", jsonArray[0]["date"]!)

            case .failure(let error):
                print(error)
            }
        print("viewDidLoad ended")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

