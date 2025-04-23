//
//  DataViewModel.swift
//  NonSmoker
//

import Foundation
import Combine
import SwiftUI

class DataViewModel: ObservableObject {
    @Published var elapsedTimeString: String = ""
    @Published var nonSmokingCount: Int = 0
    @Published var savedMoney: Int = 0
    
    private var smokingData: SmokingData
    private var timer: Timer?
    private let dataStore = SmokingDataStore.shared
    
    init() {
        // SmokingDataStoreからデータを読み込む
        smokingData = dataStore.getSmokingData()
        
        // 初期値を設定
        updateData()
        
        // タイマーを開始
        startTimer()
    }
    
    // タイマーを開始する
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateData()
        }
    }
    
    // データを更新する
    private func updateData() {
        // 最新のデータを取得
        smokingData = dataStore.getSmokingData()
        
        // 経過時間
        let time = smokingData.elapsedTime()
        elapsedTimeString = String(format: "%02dd %02dh %02dm %02ds", time.days, time.hours, time.minutes, time.seconds)
        
        // 禁煙本数
        nonSmokingCount = smokingData.nonSmokingCount()
        
        // 節約金額
        savedMoney = smokingData.savedMoney()
    }
    
    deinit {
        timer?.invalidate()
    }
}