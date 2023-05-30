//
//  LocalizedStringable.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 27/05/23.
//

import Foundation

// MARK: protocolo para abstrair NSLocalizedString e definir uma estrutura reutilizável
protocol LocalizedStringable {
    var tableName: String? { get }
    func string(by key: String, _ arguments: String...) -> String
}

// MARK: extensão que pega o nome de quem implementa este protocolo
extension LocalizedStringable {
    var tableName: String? {
        return String(describing: Self.self)
    }
}

// MARK: extensão que define um comportamento padrão para string
extension LocalizedStringable {
    func string(by key: String, _ arguments: String...) -> String {
        return String(format: NSLocalizedString(key, tableName: tableName, bundle: Bundle.main, comment: String()), locale: Locale.current, arguments)
    }
}
