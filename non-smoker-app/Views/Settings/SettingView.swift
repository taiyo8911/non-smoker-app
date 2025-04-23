//
//  SettingView.swift
//  NonSmoker
//

import SwiftUI

struct SettingView: View {
    @StateObject private var viewModel: SettingViewModel
    
    // モーダルを閉じるフラグ
    @Binding var isShowSetting: Bool
    
    // 設定が完了したら値を保存してメイン画面に戻るフラグ
    @Binding var isSettingCompleted: Bool
    
    init(isShowSetting: Binding<Bool>, isSettingCompleted: Binding<Bool>) {
        self._isShowSetting = isShowSetting
        self._isSettingCompleted = isSettingCompleted
        self._viewModel = StateObject(wrappedValue: SettingViewModel(
            isShowSetting: isShowSetting,
            isSettingCompleted: isSettingCompleted
        ))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "禁煙開始日",
                    selection: $viewModel.startDate
                )
                .datePickerStyle(CompactDatePickerStyle())
                .clipped()
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fontWeight(.bold)
                
                Group {
                    Text("1日何本吸っていましたか？")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Stepper(value: $viewModel.numberPerDay, in: 1...99, step: 1) {
                        Text("\(viewModel.numberPerDay)本")
                    }
                }
                
                Group {
                    Text("1箱の値段は？")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Stepper(value: $viewModel.pricePerBox, in: 200...990, step: 10) {
                        Text("\(viewModel.pricePerBox)円")
                    }
                }
                
                Group {
                    Text("1箱の本数は？")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Stepper(value: $viewModel.numberPerBox, in: 10...40, step: 1) {
                        Text("\(viewModel.numberPerBox)本")
                    }
                }
                
                // 保存ボタン
                Button(action: {
                    viewModel.saveSettings()
                    isShowSetting = viewModel.isShowSetting
                    isSettingCompleted = viewModel.isSettingCompleted
                }) {
                    Text("保存")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("設定")
            .padding()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isShowSetting: .constant(true), isSettingCompleted: .constant(false))
    }
}