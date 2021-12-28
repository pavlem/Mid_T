//
//  Date+Extension.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 28.12.21..
//

import Foundation

extension Date {
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: start)
        let date2 = calendar.startOfDay(for: end)
        let a = calendar.dateComponents([.day], from: date1, to: date2)
        return a.value(for: .day)!
    }
}
