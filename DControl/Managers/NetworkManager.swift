//
//  NetworkManager.swift
//  DControl
//
//  Created by Yaroslav on 24.03.2023.
//

import UIKit

class NetworkManager: UIViewController {
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtainPosts()
        
    }
    
    
    func obtainPosts() {
        
        guard let url = URL(string: "http://storage42.com/modulotest/data.json") else {
            return
        }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard let strongSelf = self else { return }
            
            if error == nil, let parsData = data {
                
                let posts = try? strongSelf.decoder.decode([Light].self, from: parsData)
            
               print("Posts: \(posts?.count)")
            }
            
                else {
                print("Error: \(error?.localizedDescription)")
            }
        } .resume()
    }
}


