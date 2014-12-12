//
//  ViewController.swift
//  Storing Images
//
//  Created by ben on 12/12/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sanFranciscoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Golden_Gate_Bridge%2C_SF_%28cropped%29.jpg/250px-Golden_Gate_Bridge%2C_SF_%28cropped%29.jpg")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response, data, error in
            
            if error != nil {
                println("there was an error")
            } else {
                
                let image = UIImage(data: data)
                
               // self.sanFranciscoImage.image = image
                
                var documentDirectory:String?
                
                var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    documentDirectory = paths[0] as? String
                    
                    var savePath = documentDirectory! + "/sanFrancisco.jpg"
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    self.sanFranciscoImage.image = UIImage(named: savePath)
                    
                }
    
            }
            
        
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

