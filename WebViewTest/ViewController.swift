//
//  ViewController.swift
//  WebViewTest
//
//  Created by sinpanda on 3/30/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var myActivityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        myActivityIndicator.center = self.view.center
//        myActivityIndicator.style = .gray
//        view.addSubview(myActivityIndicator)
        
        //Adding observer for show loading indicator
//        self.webView.addObserver(self, forKeyPath:#keyPath(WKWebView.isLoading), options: .new, context: nil)
    }

    @IBAction func searchAction(_ sender: Any) {
        func searchTextOnGoogle(text: String){
            let textComponent = text.components(separatedBy: " ")
            let searchString = textComponent.joined(separator: "+")
            let url = URL(string: "https://www.google.com/search?q=" + searchString)
            let urlRequest = URLRequest(url: url!)
            webView.load(urlRequest)
        }
        if let urlString = self.searchTF.text{
            if urlString.starts(with: "http://") || urlString.starts(with: "https://"){
                print("===========")
                print(urlString)
                print("===========")
                let url = URL(string: urlString)
                webView.load(URLRequest(url: url!))
            }else if urlString.contains("www"){
                let url = URL(string: "http://\(urlString)")
                webView.load(URLRequest(url: url!))
            }else{
                searchTextOnGoogle(text: urlString)
            }
        }
    }
    
    @IBAction func prevAction(_ sender: Any) {
        self.webView.goBack()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        self.webView.goForward()
    }
    
    
}

