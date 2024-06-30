//
//  Data+Extension.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 22.06.2024.
//

import Foundation

extension Data? {
    var emptyDataIfEmpty: Data {
        if let self { return self }
        return Data()
    }
}
