//
//  ContentView.swift
//  non-smoker-app
//
//  Created by Taiyo KOSHIBA on 2025/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataStore = SmokingDataStore.shared

    var body: some View {
        // 初期設定が完了している場合はメイン画面を表示
        if dataStore.isSettingCompleted {
            MainView()
        } else { // 初期設定が完了していない場合は初期設定画面を表示
            SettingView(isShowSetting: .constant(true), isSettingCompleted: $dataStore.isSettingCompleted)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// testです。
