//
//  ContentView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import SwiftUI

struct ContentView: View {
    let controller: ChatController
    
    @EnvironmentObject private var messages: Messages
    @EnvironmentObject private var navigation: Navigation
    
    var body: some View {
        TabView {
            ChannelsView(channels: messages.channels, controller: controller)
                .tabItem {
                    VStack {
                        Image(systemName: "message.fill")
                        Text("Channels")
                    }
                }
            Text("NETWORK TAB")
                .tabItem {
                    VStack {
                        Image(systemName: "network")
                        Text("Network")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle.fill")
                        Text("Profile")
                    }
                }
            Text("PROFILE TAB")
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
        }
        .environmentObject(messages)
    }
}

