//
//  AppLocalized.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation

// MARK: estrutura responsável por organizar as string de titulos de componentes visuais e telas, levando em consideração o nome do Enum como tableName e os cases como chaves
enum AppLocalized: String, CaseIterable, LocalizedStringable {
    case titleUsers
    case titleSearchUser
        
    var value: String {
        return string(by: rawValue)
    }
}
