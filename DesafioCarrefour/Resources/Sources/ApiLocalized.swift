//
//  ApiLocalized.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 27/05/23.
//

import Foundation

// MARK: estrutura responsável por organizar as string de APIs, levando em consideração o nome do Enum como tableName e os cases como chaves
enum ApiLocalized: String, LocalizedStringable {
    case users
    case repos
    
    var value: String {
        return  Self.baseURL+string(by: rawValue)
    }
    
    func value(by value: String) -> String {
        return Self.baseURL+value+string(by: rawValue)
    }
}

// MARK: implementação para pegar a URL base de um arquivo .plist
extension ApiLocalized: PropertyListable {
    static var baseURL: String = {
        return propertyString(key: "baseURL")
    }()
}
