//
//  Networking.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Alamofire
import Foundation

class Networking {
    private static let jsonQeryItem = URLQueryItem(name: "render", value: "json")

    static let shared = Networking.init()
    private init(){}

    func fetchMenu(_ completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        fetch(AppConfig.menuURL, completion: completion)
    }

    // I could remove this method and use directly fetch(), but it will be easier to work in case I need to extend API
    func fetchList(_ urlString: String, completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        fetch(urlString, completion: completion)
    }
    
    
    private func fetch<T: Decodable>(_ urlString: String, completion: @escaping (Result<T, Error>) -> Void){
        guard var components = URLComponents(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        if components.queryItems == nil {
            components.queryItems = [Self.jsonQeryItem]
        } else {
            components.queryItems?.append(Self.jsonQeryItem)
        }
        guard let url = components.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        AF.request(url).responseDecodable(of: T.self) { responseData in
            completion(responseData.result.mapError{ $0.underlyingError ?? $0 })
        }
    }
}
