//
//  NetworkManager.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    
    
    func getModel<T: Decodable>(url: URL?,
                                headers: [String: String]?,
                                parametres: [String: Any]?,
                                completionHandler: @escaping (Result<T, Error>) -> ()) {
        
        guard let url = url else { return }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: Constants.apiTimeoutInterval)
        
        headers?.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let parametres = parametres {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parametres)
        }
        
        sendRequest(request: &request, completionHandler: completionHandler)
    }
    
    func sendRequest<T: Decodable>(request: inout URLRequest, completionHandler: @escaping (Result<T, Error>) -> () ) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, responseError in
            
            if let error = responseError {
                completionHandler(.failure(error))
                return
                
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                let error = NSError(domain: "bad connection", code: 404)
                print("bad connection")
                completionHandler(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "bad responce data", code: statusCode)
                print("bad responce data")
                completionHandler(.failure(error))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(result))
            } catch {
                completionHandler(.failure(error))
            }
        }
        
        dataTask.resume()
    }
    
    func getImage(by url: URL?, complitionHandler: @escaping (UIImage) -> Void) {
        guard let url = url else { return }
        
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: Constants.apiTimeoutInterval)
        
//        headers?.forEach {
//            request.addValue($0.value, forHTTPHeaderField: $0.key)
//        }
//
//        if let parametres = parametres {
//            request.httpBody = try? JSONSerialization.data(withJSONObject: parametres)
//        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, responseError in
            
            
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            
            complitionHandler(image)
        }
        
        dataTask.resume()
    }
}


struct Constants {
    static let apiTimeoutInterval: TimeInterval = TimeInterval(20)
}
