//
//  ViewController.swift
//  JsonAPI
//
//  Created by Kyle on 2016/6/21.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Firebase

var playArray:[jsonarrayClass] = []

class ViewController: UIViewController {

    @IBAction func online(sender: AnyObject) {
    
     let ref = FIRDatabase.database().reference()
        
        for playdata in playArray{
            print(playdata)
        
            ref.child(playdata.title).setValue([playdata.serve,playdata.cat1])

        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadData(sender: AnyObject) {
        let urlString = "http://data.taipei/opendata/datalist/apiAccess"
        
        Alamofire.request(.GET, urlString, parameters: ["scope" : "resourceAquire", "rid":"36847f3f-deff-4183-a5bb-800737591de5", "offset":"5", "limit":"10"]).responseJSON{
            response in
            
            if let data = response.result.value{
                let json = JSON(data)

                let playList = json["result"]["results"].arrayValue
                
                for play in playList{
                 
                    
                    let play2 = jsonarrayClass(serve: play["CAT2"].stringValue, title: play["stitle"].stringValue, cat1: play["CAT1"].stringValue)
                    
                   playArray.append(play2)
                    
                    
                }
            }
        }
    }
    
}

