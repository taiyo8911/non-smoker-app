//
//  MessageView.swift
//  non-smoker-app
//
//  Created by Taiyo KOSHIBA on 2025/04/23.
//


import SwiftUI

struct MessageView: View {
    // メッセージ
    let messages = [
        "禁煙は健康への第一歩！",
        "吸わない自分に誇りを！",
        "タバコを断って自由に！",
        "禁煙で新たな始まり！",
        "たばこなし、明るい未来！",
        "タバコを忘れて笑おう！",
        "禁煙で新しい自分へ！",
        "煙を消し、健康を手に！",
        "未来のために禁煙しよう！",
        "タバコはさよなら、元気をハロー！"
    ]
    
    var body: some View {
        // メッセージをランダムに表示
        Text(messages.randomElement()!)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
