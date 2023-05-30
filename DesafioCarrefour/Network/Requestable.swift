//
//  Requestable.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 27/05/23.
//

import Foundation

// MARK: protocolo que define uma 
protocol Requestable {
    func request<T>(apiCall: APICall, completion: @escaping (Result<T, HTTPErrorType>) -> Void) where T: Decodable
}

// MARK: extensão que define um comportamento padrão para request
extension Requestable {
    func request<T>(apiCall: APICall, completion: @escaping (Result<T, HTTPErrorType>) -> Void) where T: Decodable {
        guard let urlRequest = try? apiCall.urlRequest() else { return completion(.failure(HTTPErrorType.invalidURL)) }
        
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            guard error == nil else { return }
            guard let data = data, let _ = urlResponse as? HTTPURLResponse,
                  let deserialized = try? JSONDecoder().decode(T.self, from: data) else { return completion(.failure(HTTPErrorType.deserialization)) }
            
            completion(.success(deserialized))
        }.resume()
    }
}
