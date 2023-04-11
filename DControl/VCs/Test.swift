//
//  Test.swift
//  DControl
//
//  Created by Yaroslav on 11.04.2023.
//

import UIKit

class Test: UIViewController {
    
    var mode: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        //title = "Test"
        
//        NetworkManager2.shared.getDevices(for: mode, intensity: 1) { devices, errorMessage in
//            guard let devices = devices else {
//                self.showAlert()
//                return
//            }
        }
    }
    
//    func showAlert() {
//        let alert = UIAlertController(title: "Title", message: "Hey, smt. wrong", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
//        present(alert, animated: true)
//    }
