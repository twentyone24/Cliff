//
//  Profile.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import Combine
import DistributedChat

class Profile: ObservableObject {
    @Published(persistingTo: "Profile/presence.json") var presence: ChatPresence = ChatPresence()
    
    var me: ChatUser { presence.user }
}
