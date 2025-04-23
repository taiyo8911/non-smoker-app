//
//  MainView.swift
//  NonSmoker
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // 背景を塗りつぶす
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                //　ビューを縦並びに配置
                VStack {
                    // ビューを横並びに配置
                    HStack {
                        Spacer()
                        // ナビゲーション
                        NavigationLink(destination: SettingItemsView()) {
                            Image(systemName: "ellipsis")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(8.0)
                                .padding()
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    // メッセージ
                    MessageView()
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    // 詳細データ
                    DataView()
                        .frame(width: 350)
                        .foregroundColor(.white)
                        .border(Color.white, width: 3)
                        .padding()
                    
                    Spacer()
                    
                    // シェアボタン
                    Button(action: {
                        // シェア画面表示フラグ
                        viewModel.toggleShareSheet()
                    }) {
                        Text("Share")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.white.opacity(0.1))
                            .border(Color.white, width: 2)
                            .cornerRadius(8.0)
                            .padding()
                    }
                    .padding()
                    
                    Spacer()
                }
                // シェア画面をモーダル表示
                .sheet(isPresented: $viewModel.isShowShareSheet) {
                    ShareSheet()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}