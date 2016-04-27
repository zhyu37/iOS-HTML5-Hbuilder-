//
//  ViewController.swift
//  Html54.27
//
//  Created by zhyu on 16/4/27.
//  Copyright © 2016年 zhyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let webView = UIWebView()
        webView.frame = UIScreen.mainScreen().bounds
        view.addSubview(webView)
        do{
            let filePath = NSBundle.mainBundle().pathForResource("index", ofType: "html")
            let html = try String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
            webView.loadHTMLString(html, baseURL: nil)
        }catch{
            
        }
        
    }

}

