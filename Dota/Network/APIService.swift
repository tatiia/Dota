//
//  MatchWebService.swift
//  Dota
//
//  Created by Tatia on 09.04.21.
//

import Foundation
import UIKit

class APIService {
    public static let service = APIService()
    
    typealias CompletionBlock<T: Codable> = (Result<T, Error>) -> ()
    
    func get<T: Codable>(url: String, completion: @escaping CompletionBlock<T>) {
        guard let url = URL(string: url) else {return}
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                guard let data = data else {return}
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(T.self, from: data)
                
                completion(.success(decoded))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func downloadImage(from url: URL, imageView: UIImageView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
