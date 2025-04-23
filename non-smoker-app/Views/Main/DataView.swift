//
//  DataView.swift
//  non-smoker-app
//
//  Created by Taiyo KOSHIBA on 2025/04/23.
//


import SwiftUI

struct DataView: View {
    @StateObject private var viewModel = DataViewModel()
    
    var body: some View {
        // データ表示
        VStack {
            // 経過時間を表示
            Label(
                title: {
                    Text("\(viewModel.elapsedTimeString)")
                        .font(Font(UIFont.monospacedSystemFont(ofSize: 15, weight: .bold)))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("⏰")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            )
            .padding()
            
            // 本数を表示
            Label(
                title: {
                    Text("\(viewModel.nonSmokingCount) cigs")
                        .font(Font(UIFont.monospacedSystemFont(ofSize: 16, weight: .bold)))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("🚬")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            )
            .padding()
            
            // 節約できた金額表示
            Label(
                title: {
                    Text("\(viewModel.savedMoney) yen")
                        .font(Font(UIFont.monospacedSystemFont(ofSize: 16, weight: .bold)))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("💲")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            )
            .padding()
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
