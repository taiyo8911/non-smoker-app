//
//  SettingItemsView.swift
//  NonSmoker
//

import SwiftUI

struct SettingItemsView: View {
    @StateObject private var viewModel = SettingItemsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // 各種設定ボタン
                Button {
                    viewModel.toggleSettingModal()
                } label: {
                    Text("各種設定")
                        .padding()
                }
                .sheet(isPresented: $viewModel.isShowSetting) {
                    SettingView(isShowSetting: $viewModel.isShowSetting, isSettingCompleted: $viewModel.isSettingCompleted)
                }
                
                // リセットボタン
                Button {
                    viewModel.toggleAlert()
                } label: {
                    Text("設定リセット")
                        .padding()
                        .foregroundColor(.red)
                }
                // アラート表示
                .alert(isPresented: $viewModel.isShowAlert) {
                    Alert(
                        title: Text("リセットしますか？"),
                        primaryButton: .cancel(Text("キャンセル")),
                        secondaryButton: .destructive(Text("リセット"), action: {
                            viewModel.resetSettings()
                        })
                    )
                }
            }
            .navigationTitle("設定")
        }
    }
}

struct SettingItemsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingItemsView()
    }
}