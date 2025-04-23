//
//  MainViewModel.swift
//  NonSmoker
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var isShowShareSheet = false
    
    func toggleShareSheet() {
        isShowShareSheet.toggle()
    }
}