//
//  PropertyListable.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation

// MARK: protocolo para abstrair PropertyListSerialization de arquivos do tipo plist e definir uma estrutura reutilizável
protocol PropertyListable {
    static var fileName: String { get }
    static func propertyString(key: String) -> String
}

// MARK: extensão que define uma propriedade com um valor padrão, levando em consideração o nome da classe que implementa este protocolo
extension PropertyListable {
    static var fileName: String {
        return String(describing: Self.self)
    }
}

// MARK: extensão que define um comportamento padrão para propertyString
extension PropertyListable {
    static func propertyString(key: String) -> String {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: String] else { return .init() }
        
        return plist[key] ?? .init()
    }
}
