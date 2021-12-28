//
//  String+Extension.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 28.12.21..
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}

