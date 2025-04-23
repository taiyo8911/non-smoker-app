//
//  SmokingData.swift
//  non-smoker-app
//
//  Created by Taiyo KOSHIBA on 2025/04/23.
//



import Foundation

struct SmokingData {
    var startDate: Date
    var numberPerDay: Int
    var pricePerBox: Int
    var numberPerBox: Int

    // 経過時間を計算する
    func elapsedTime() -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: startDate, to: Date())
        return (
            days: components.day ?? 0,
            hours: components.hour ?? 0,
            minutes: components.minute ?? 0,
            seconds: components.second ?? 0
        )
    }

    // 禁煙本数を計算する
    func nonSmokingCount() -> Int {
        let days = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
        return numberPerDay * days
    }

    // 節約金額を計算する
    func savedMoney() -> Int {
        guard numberPerBox > 0 else { return 0 }
        let pricePerOne = pricePerBox / numberPerBox
        return pricePerOne * nonSmokingCount()
    }
}
