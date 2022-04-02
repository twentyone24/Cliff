//
//  ContactAttachmentView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import SwiftUI

struct ContactAttachmentView: View {
    let attachment: ChatAttachment
    
    var body: some View {
        QuickLookAttachmentView(attachment: attachment) {
            HStack {
                Image(systemName: "person.fill")
                Text(attachment.name)
            }
        }
    }
}
