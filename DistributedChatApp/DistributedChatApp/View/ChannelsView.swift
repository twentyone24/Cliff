//
//  ChannelsView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import SwiftUI

struct ChannelsView: View {
    let channels: [ChatChannel?]
    let controller: ChatController
    
    @EnvironmentObject private var messages: Messages
    @EnvironmentObject private var navigation: Navigation
    @EnvironmentObject private var network: Network
    @State private var newChannels: [ChatChannel] = []
    @State private var channelDraftSheetShown: Bool = false
    @State private var deletingChannels: [ChatChannel?] = []
    @State private var deletionConfirmationShown: Bool = false
    
    private var allChannels: [ChatChannel?] {
        channels + newChannels.filter { !channels.contains($0) }
    }
    
    var body: some View {
        NavigationView {
            List {
                let nearbyCount = network.nearbyUsers.count
                let reachableCount = network.presences.filter { $0.key != controller.me.id }.count
                HStack {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                    Text("\(reachableCount) \("user".pluralized(with: reachableCount)) reachable, \(nearbyCount) \("user".pluralized(with: nearbyCount)) nearby")
                }
                ForEach(allChannels, id: \.self) { channel in
                    NavigationLink(destination: ChannelView(channel: channel, controller: controller), tag: channel, selection: $navigation.activeChannel) {
                        ChannelSnippetView(channel: channel)
                    }
                    .contextMenu {
                        Button(action: {
                            
                        }) {
                            Text("Delete Locally")
                            Image(systemName: "trash")
                        }
                        if messages.unreadChannels.contains(channel) {
                            Button(action: {
                                messages.markAsRead(channel: channel)
                            }) {
                                Text("Mark as Read")
                                Image(systemName: "circlebadge")
                            }
                        }
                        Button(action: {
                            UIPasteboard.general.url = URL(string: "distributedchat:///channel\(channel.map { "/\($0)" } ?? "")")
                        }) {
                            Text("Copy Channel URL")
                            Image(systemName: "doc.on.doc.fill")
                        }
                    }
                }
                .onDelete { indexSet in
                    deletingChannels = indexSet.map { allChannels[$0] }
                    deletionConfirmationShown = true
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Channels")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        channelDraftSheetShown = true
                    }) {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                    }
                }
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .onReceive(navigation.$activeChannel) {
            if case let channel?? = $0, !allChannels.contains(channel) {
                newChannels = [channel]
            }
        }
    }
}

