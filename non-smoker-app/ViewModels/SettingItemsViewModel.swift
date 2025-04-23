//
//  SettingItemsViewModel.swift
//  NonSmoker
//

import Foundation
import SwiftUI

class SettingItemsViewModel: ObservableObject {
    @Published var isShowAlert = false
    @Published var isShowSetting = false
    @Published var isSettingCompleted = false
    
    private let dataStore = SmokingDataStore.shared
    
    func toggleSettingModal() {
        isShowSetting.toggle()
    }
    
    func toggleAlert() {
        isShowAlert.toggle()
    }
    
    func resetSettings() {
        dataStore.resetSettings()
        isSettingCompleted = false
    }
}