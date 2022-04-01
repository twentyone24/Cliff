//
//  BubbleMessageView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import SwiftUI

struct BubbleMessageView: View {
    let message: ChatMessage
    let isMe: Bool
    var onPressRepliedMessage: ((UUID) -> Void)? = nil
    
    @EnvironmentObject private var messages: Messages
    
    var body: some View {
        VStack(alignment: isMe ? .trailing : .leading) {
            if let id = message.repliedToMessageId, let referenced = messages[id] {
                Button(action: {
                    onPressRepliedMessage?(id)
                }) {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.backward")
                        Text("\(referenced.author.displayName): \(referenced.displayContent)")
                    }
                    .foregroundColor(.secondary)
                }
            }
            ZStack {
                VStack(alignment: .leading) {
                    if message.isEncrypted {
                        HStack {
                            Image(systemName: "lock.fill")
                            Text("Encrypted")
                                .foregroundColor(isMe ? .white : .gray)
                        }
                    } else {
                        HStack {
                            if message.wasEncrypted ?? false {
                                Image(systemName: "lock")
                            }
                            Text(message.author.displayName)
                        }
                            .font(.caption)
                            .foregroundColor(isMe ? .white : .gray)
                        if let content = message.content.asText, !content.isEmpty {
                            Text(content)
                        } 
                    }
                }
                .foregroundColor(isMe ? .white : .black)
                .padding(10)
                .background(isMe
                    ? LinearGradient(gradient: Gradient(colors: [
                            Color(red: 0, green: 0.5, blue: 1),  // Blue
                            Color(red: 0, green: 0.4, blue: 0.7) // Darker blue
                        ]), startPoint: .top, endPoint: .bottom)
                    : LinearGradient(gradient: Gradient(colors: [
                            Color(red: 0.9, green: 0.9, blue: 0.9),
                            Color(red: 0.9, green: 0.9, blue: 0.9)
                        ]), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(10)
            }
        }
    }
}

