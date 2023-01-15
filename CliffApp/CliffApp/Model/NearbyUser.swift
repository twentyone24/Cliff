//
//  NearbyUser.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import CliffTransportSDK
import Foundation

struct NearbyUser: Identifiable, Hashable {
    var peripheralIdentifier: UUID
    var peripheralName: String? = nil
    var chatUser: ChatUser? = nil
    var rssi: Int? = nil // in dB
    
    var id: UUID { peripheralIdentifier }
    var displayName: String { chatUser?.displayName ?? peripheralName ?? peripheralIdentifier.uuidString }
}
