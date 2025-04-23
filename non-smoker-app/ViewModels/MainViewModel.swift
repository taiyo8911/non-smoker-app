//
//  MainViewModel.swift
//  non-smoker-app
//
//  Created by Taiyo KOSHIBA on 2025/04/23.
//


import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var isShowShareSheet = false
    
    func toggleShareSheet() {
        isShowShareSheet.toggle()
    }
}
