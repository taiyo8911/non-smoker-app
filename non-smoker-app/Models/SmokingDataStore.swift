//
//  SmokingDataStore.swift
//  NonSmoker
//

import Foundation
import Combine

// データの永続化を担当するクラス
class SmokingDataStore {
    // デフォルト値の定義
    private let defaultNumberPerDay = 10
    private let defaultPricePerBox = 600
    private let defaultNumberPerBox = 20
    
    private let userDefaults = UserDefaults.standard
    
    // シングルトンインスタンス
    static let shared = SmokingDataStore()
    
    private init() {}
    
    // 設定が完了しているかどうか
    var isSettingCompleted: Bool {
        get { userDefaults.bool(forKey: "isSettingCompleted") }
        set { userDefaults.set(newValue, forKey: "isSettingCompleted") }
    }
    
    // SmokingDataを取得する
    func getSmokingData() -> SmokingData {
        let startComponents = DateComponents(
            year: userDefaults.integer(forKey: "startYear"),
            month: userDefaults.integer(forKey: "startMonth"),
            day: userDefaults.integer(forKey: "startDay"),
            hour: userDefaults.integer(forKey: "startHour"),
            minute: userDefaults.integer(forKey: "startMinute"),
            second: userDefaults.integer(forKey: "startSecond")
        )
        
        let startDate = Calendar.current.date(from: startComponents) ?? Date()
        let numberPerDay = userDefaults.integer(forKey: "numberPerDay")
        let pricePerBox = userDefaults.integer(forKey: "pricePerBox") 
        let numberPerBox = userDefaults.integer(forKey: "numberPerBox")
        
        return SmokingData(
            startDate: startDate,
            numberPerDay: numberPerDay,
            pricePerBox: pricePerBox,
            numberPerBox: numberPerBox
        )
    }
    
    // 禁煙開始日を保存する
    func saveStartDate(date: Date) {
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        userDefaults.set(components.year, forKey: "startYear")
        userDefaults.set(components.month, forKey: "startMonth")
        userDefaults.set(components.day, forKey: "startDay")
        userDefaults.set(components.hour, forKey: "startHour")
        userDefaults.set(components.minute, forKey: "startMinute")
        userDefaults.set(0, forKey: "startSecond")
    }
    
    // 喫煙データを保存する
    func saveSmokeSettings(numberPerDay: Int, pricePerBox: Int, numberPerBox: Int) {
        userDefaults.set(numberPerDay, forKey: "numberPerDay")
        userDefaults.set(pricePerBox, forKey: "pricePerBox")
        userDefaults.set(numberPerBox, forKey: "numberPerBox")
    }
    
    // 設定をリセットする
    func resetSettings() {
        let appDomain = Bundle.main.bundleIdentifier
        userDefaults.removePersistentDomain(forName: appDomain!)
        
        // デフォルト値を再設定する
        userDefaults.set(defaultNumberPerDay, forKey: "numberPerDay")
        userDefaults.set(defaultPricePerBox, forKey: "pricePerBox")
        userDefaults.set(defaultNumberPerBox, forKey: "numberPerBox")
        
        let currentDate = Date()
        let calendar = Calendar.current
        userDefaults.set(calendar.component(.year, from: currentDate), forKey: "startYear")
        userDefaults.set(calendar.component(.month, from: currentDate), forKey: "startMonth")
        userDefaults.set(calendar.component(.day, from: currentDate), forKey: "startDay")
        userDefaults.set(calendar.component(.hour, from: currentDate), forKey: "startHour")
        userDefaults.set(calendar.component(.minute, from: currentDate), forKey: "startMinute")
        userDefaults.set(0, forKey: "startSecond")
        
        isSettingCompleted = false
    }
}