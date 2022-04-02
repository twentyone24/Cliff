//
//  SimpleUIViewControllerRepresentable.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import SwiftUI

protocol SimpleUIViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(coordinator: Coordinator) -> UIViewControllerType
}

extension SimpleUIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewControllerType {
        makeUIViewController(coordinator: context.coordinator)
    }
    
    func presentIndependently() {
        let viewController = makeUIViewController(coordinator: makeCoordinator())
        UIApplication.shared.windows.first?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
}
