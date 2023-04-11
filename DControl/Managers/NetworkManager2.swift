//
//  NetworkManager2.swift
//  DControl
//
//  Created by Yaroslav on 01.04.2023.
//

import Foundation

class NetworkManager2 {
    static let shared = NetworkManager2()
    let baseURL = "http://storage42.com/modulotest/"
    
    private init() {}
    
    
    func getDevices(for deviceName: String, mode: String, intensity: Int, completed: @escaping ([Light]?, String?) -> Void) {
        let endpoint = baseURL + "/data\(deviceName).json"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This name is invalid.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, responce, error in
            if let _ = error {
                completed(nil, "Unable to complete your  request. Please check your internet connection")
            }
            
            guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let mode = try decoder.decode([Light].self, from: data)
                completed(mode, nil)
            } catch {
                completed(nil, "The data received from the server was invalid. Please try again.")
            }
            
        }
        
        task.resume()
    }
}
