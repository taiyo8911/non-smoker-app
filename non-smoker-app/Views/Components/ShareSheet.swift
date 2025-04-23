//
//  ShareSheetView.swift
//  NonSmoker
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        guard let image = takeScreenshot() else {
            fatalError("スクリーンショットの取得に失敗しました。")
        }

        let text = "#NONSMO"
        let items: [Any] = [text, image]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return activityVC
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
    }

    private func takeScreenshot() -> UIImage? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(bounds: window.bounds)
        let image = renderer.image { _ in
            window.drawHierarchy(in: window.bounds, afterScreenUpdates: false)
        }

        return image
    }
}