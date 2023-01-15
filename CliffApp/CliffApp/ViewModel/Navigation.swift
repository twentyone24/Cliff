//
//  Navigation.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import Combine
import CliffTransportSDK

class Navigation: ObservableObject {
    @Published var activeChannel: ChatChannel?? = nil
    
    func open(channel: ChatChannel?) {
        activeChannel = Optional.some(channel)
    }
}
