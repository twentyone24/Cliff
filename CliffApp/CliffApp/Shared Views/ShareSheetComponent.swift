//
//  ShareSheet.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//


import SwiftUI
import UIKit
import Logging

fileprivate let log = Logger(label: "CliffApp.ShareSheet")

struct ShareSheet: SimpleUIViewControllerRepresentable {
    let items: [Any]
    var onDismiss: (() -> Void)? = nil
    
    func makeUIViewController(coordinator: ()) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        vc.completionWithItemsHandler = { _, _, _, error in
            if let error = error {
                log.error("Error after completing share sheet: \(error)")
                return
            }
            onDismiss?()
        }
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // Do nothing
    }
}
