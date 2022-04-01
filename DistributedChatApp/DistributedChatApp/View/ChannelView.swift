//
//  ChannelView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import SwiftUI

struct ChannelView: View {
    let channel: ChatChannel?
    let controller: ChatController
    
    @EnvironmentObject private var messages: Messages
    @EnvironmentObject private var network: Network
    @State private var replyingToMessageId: UUID?
    
    var body: some View {
        VStack(alignment: .leading) {
            MessageHistoryView(channel: channel, controller: controller, replyingToMessageId: $replyingToMessageId)
            MessageComposeView(channel: channel, controller: controller, replyingToMessageId: $replyingToMessageId)
        }
        .padding(15)
        .navigationTitle(channel.displayName(with: network))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            messages.autoReadChannels.insert(channel)
            messages.markAsRead(channel: channel)
        }
        .onDisappear {
            messages.autoReadChannels.remove(channel)
        }
    }
}

