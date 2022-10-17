//
//  NetworkExtension.swift
//  Countries
//
//  Created by Alper Yıldırım on 17.10.2022.
//

import Foundation

extension URLSession {
    static  let baseUrl = "https://wft-geo-db.p.rapidapi.com/v1/geo"
    static fileprivate let apiToken = "be135ef7cemshaf0b136b1e5fcc5p1a5e5cjsne5d0e29550e3"
    
    /// Generic function to send HTTP requests with given object's runtime type. Object can be passsed with [expecting].
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>)-> Void
    ){
        
        guard let url = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.addValue(URLSession.apiToken, forHTTPHeaderField: "X-RapidAPI-Key")
        
        
        let task = dataTask(with: request){ data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Server error: \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    ///   Same function but with async-await, just in case.
    //    func request<T: Codable>(
    //        requestUrl: URL,
    //        expecting: T.Type
    //    ) async throws ->  T {
    //       let (data, _) = try await data(from: url)
    //        let decoder = JSONDecoder()
    //        return try decoder.decode(T.self, from: data)
    //    }
}

