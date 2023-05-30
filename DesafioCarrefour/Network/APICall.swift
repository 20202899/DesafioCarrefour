//
//  APICall.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 27/05/23.
//

import Foundation

// MARK: struct que define um modelo para requisição HTTP
struct APICall {
    var url: String
    
    let method: HTTPMethodType
    
    init(url: String, method: HTTPMethodType) {
        self.url = url
        self.method = method
    }
}

// MARK: extensão para organizar função de criar urlRequest
extension APICall {
    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: self.url) else { throw HTTPErrorType.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue.uppercased()
        
        return urlRequest
    }
}

// MARK: enum para descrever verbos HTTP
enum HTTPMethodType: String {
    case get
    case post
    case put
    case delete
}

// MARK: enum para descrever erros específicos
enum HTTPErrorType: Error {
    case invalidURL
    case deserialization
    case unknown(Int)
}
