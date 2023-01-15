//
//  ChatStatus+Color.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import CliffTransportSDK
import SwiftUI

extension ChatStatus {
    var color: Color {
        switch self {
        case .online:
            return .green
        case .away:
            return .yellow
        case .busy:
            return .red
        case .offline:
            return .gray
        }
    }
}
