//
//  DateExtensions.swift
//  non-smoker-app
//
//  Created by Taiyo KOSHIBA on 2025/04/23.
//


import Foundation

extension Date {
    // 日付から年、月、日を抽出するユーティリティメソッド
    func components() -> DateComponents {
        let calendar = Calendar.current
        return calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
    }

    // 日付の差分を計算するユーティリティメソッド
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: date)
        return components.day ?? 0
    }
}
