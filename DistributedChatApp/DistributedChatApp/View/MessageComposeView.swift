//
//  MessageComposeView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import Contacts
import Logging
import SwiftUI
import SwiftUIKit

fileprivate let log = Logger(label: "DistributedChatApp.MessageComposeView")

/// The compression algorithm used for encoding.
fileprivate let compression: ChatAttachment.Compression = .lzfse

struct MessageComposeView: View {
    let channel: ChatChannel?
    let controller: ChatController
    @Binding var replyingToMessageId: UUID?
    
    @EnvironmentObject private var messages: Messages
    @EnvironmentObject private var network: Network
    @State private var draft: String = ""
    @State private var attachmentActionSheetShown: Bool = false
    @State private var attachmentFilePickerShown: Bool = false
    @State private var attachmentContactPickerShown: Bool = false
    @State private var attachmentImagePickerShown: Bool = false
    @State private var attachmentImagePickerStyle: ImagePicker.SourceType = .photoLibrary

    
    var body: some View {
        ZStack {
            
            VStack {
                if let id = replyingToMessageId, let message = messages[id] {
                    ClosableStatusBar(onClose: {
                        replyingToMessageId = nil
                    }) {
                        HStack {
                            Text("Replying to")
                            Text("\(message.author.displayName): \(message.displayContent)")
                        }
                    }
                }
                HStack {
                    Button(action: { attachmentActionSheetShown = true }) {
                        Image(systemName: "plus")
                            .font(.system(size: iconSize))
                    }
                    TextField("Message \(channel.displayName(with: network))...", text: $draft, onCommit: sendDraft)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                        Button(action: sendDraft) {
                            Image(systemName: "plus")
                                .font(.system(size: iconSize))
                        }
                    
                }
                
            }
            .actionSheet(isPresented: $attachmentActionSheetShown) {
                ActionSheet(
                    title: Text("Add Attachment"),
                    buttons: [
                        .default(Text("Photo Library")) {
                            attachmentImagePickerStyle = .photoLibrary
                            attachmentImagePickerShown = true
                        },
                        .default(Text("Camera")) {
                            attachmentImagePickerStyle = .camera
                            attachmentImagePickerShown = true
                        },
                        .default(Text("Contact")) {
                            attachmentContactPickerShown = true
                        },
                        .default(Text("File")) {
                            attachmentFilePickerShown = true
                        },
                        .cancel {
                            // TODO: Workaround for attachmentFilePickerShown
                            attachmentFilePickerShown = false
                        },
                    ]
                )
            }
        }
    }
    
    private func sendDraft() {
        if !draft.isEmpty {
            
            controller.send(content: draft, on: channel, attaching: nil, replyingTo: replyingToMessageId)
            clearDraft()
        }
    }
    
    private func clearDraft() {
        draft = ""
        replyingToMessageId = nil
    }
    
}

