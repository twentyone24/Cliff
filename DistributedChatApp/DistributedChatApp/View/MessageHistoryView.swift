//
//  MessageHistoryView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import SwiftUI
import UIKit

struct MessageHistoryView: View {
    let channel: ChatChannel?
    let controller: ChatController
    @Binding var replyingToMessageId: UUID?
    
    @EnvironmentObject private var messages: Messages
    
    var body: some View {
        ScrollView(.vertical) {
            ScrollViewReader { scrollView in
                VStack(alignment: .leading) {
                    ForEach(messages[channel]) { message in
                        MessageView(message: message, controller: controller, replyingToMessageId: $replyingToMessageId) { id in
                            scrollView.scrollTo(id)
                        }
                    }
                }
                .frame( // Ensure that the VStack actually fills the parent's width
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .onAppear {
                    if let id = messages[channel].last?.id {
                        scrollView.scrollTo(id)
                    }
                }
                .onChange(of: messages.messages) { _ in
                    if let id = messages[channel].last?.id {
                        scrollView.scrollTo(id)
                    }
                }
            }
        }
    }
}

