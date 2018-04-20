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
                guard let jsonArray = value as? Array<[String: Any]> else { return }
                var videos: [Video] = []
                
                for item in jsonArray {
                    guard let video = Video(json: item) else { return }
                    videos.append(video)
                }

                print(videos)

            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

