//
//  ChannelSnippetView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import SwiftUI
import DistributedChat

struct ChannelSnippetView: View {
    let channel: ChatChannel?
    
    @EnvironmentObject private var messages: Messages
    @EnvironmentObject private var network: Network
    
    var body: some View {
        HStack {
            if messages.unreadChannels.contains(channel) {
                Image(systemName: "circlebadge.fill")
                    .foregroundColor(.blue)
            } else if case .dm(_) = channel {
                Image(systemName: "at")
            } else {
                Image(systemName: "number")
            }
            VStack(alignment: .leading) {
                Text(channel.rawDisplayName(with: network))
                    .font(.headline)
                
                   
            }
            if messages.pinnedChannels.contains(channel) {
                Spacer()
                Image(systemName: "pin.circle.fill")
            }
        }
    }
}

