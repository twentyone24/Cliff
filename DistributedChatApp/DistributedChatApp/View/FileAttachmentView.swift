//
//  FileAttachmentView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import DistributedChat
import SwiftUI

struct FileAttachmentView: View {
    let attachment: ChatAttachment
    
    var body: some View {
        QuickLookAttachmentView(attachment: attachment) {
            HStack {
                Image(systemName: "doc.fill")
                Text(attachment.name)
            }
        }
    }
}

struct FileAttachmentView_Previews: PreviewProvider {
    static var previews: some View {
        AttachmentView(attachment: ChatAttachment(name: "test.txt", content: .url(URL(string: "data:text/plain;base64,dGVzdDEyMwo=")!)))
    }
}
