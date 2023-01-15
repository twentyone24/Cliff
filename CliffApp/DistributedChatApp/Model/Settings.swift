//
//  Settings.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import Combine
import Foundation

class Settings: ObservableObject {
    @Published(persistingTo: "Settings/presentation.json") var presentation = Presentation()
    @Published(persistingTo: "Settings/bluetooth.json") var bluetooth = Bluetooth()
    
    struct Presentation: Codable {
        // TODO: var messageHistoryStyle: MessageHistoryStyle = .bubbles
        var showChannelPreviews: Bool = true
    }
    
    struct Bluetooth: Codable {
        var advertisingEnabled: Bool = true
        var scanningEnabled: Bool = true
        var monitorSignalStrength: Bool = true
        var monitorSignalStrengthInterval: Int = 5 // seconds
    }
}
