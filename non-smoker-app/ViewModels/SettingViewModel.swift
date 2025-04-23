//
//  SettingViewModel.swift
//  non-smoker-app
//
//  Created by Taiyo KOSHIBA on 2025/04/23.
//

import Foundation
import SwiftUI

class SettingViewModel: ObservableObject {
    @Published var startDate: Date
    @Published var numberPerDay: Int
    @Published var pricePerBox: Int
    @Published var numberPerBox: Int

    private let dataStore = SmokingDataStore.shared

    // バインディング用のプロパティ
    @Published var isShowSetting: Bool
    @Published var isSettingCompleted: Bool

    init(isShowSetting: Binding<Bool>? = nil, isSettingCompleted: Binding<Bool>? = nil) {
        // 現在の日時をデフォルト値として使用
        self.startDate = Date()

        // SmokingDataStoreからデータを読み込む
        let smokingData = dataStore.getSmokingData()

        // 取得したデータが有効な場合、開始日を設定
        let components = DateComponents(
            calendar: Calendar.current,
            timeZone: TimeZone.current,
            year: UserDefaults.standard.integer(forKey: "startYear"),
            month: UserDefaults.standard.integer(forKey: "startMonth"),
            day: UserDefaults.standard.integer(forKey: "startDay"),
            hour: UserDefaults.standard.integer(forKey: "startHour"),
            minute: UserDefaults.standard.integer(forKey: "startMinute")
        )

        // コンポーネントが有効かチェックして、日付に変換
        if let date = components.date,
           components.year != 0,
           components.month != 0,
           components.day != 0 {
            self.startDate = date
        }

        self.numberPerDay = smokingData.numberPerDay
        self.pricePerBox = smokingData.pricePerBox
        self.numberPerBox = smokingData.numberPerBox

        self.isShowSetting = isShowSetting?.wrappedValue ?? true
        self.isSettingCompleted = isSettingCompleted?.wrappedValue ?? dataStore.isSettingCompleted
    }

    // 設定を保存
    func saveSettings() {
        // データを保存
        dataStore.saveStartDate(date: startDate)
        dataStore.saveSmokeSettings(
            numberPerDay: numberPerDay,
            pricePerBox: pricePerBox,
            numberPerBox: numberPerBox
        )

        // 設定完了フラグを更新
        dataStore.isSettingCompleted = true
        dataStore.saveIsSettingCompleted() // UserDefaultsに保存するためのメソッド呼び出し
        isSettingCompleted = true

        // モーダルを閉じる
        isShowSetting = false
    }
}
