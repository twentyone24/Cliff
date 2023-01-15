//
//  URLUtils.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import Foundation
import MobileCoreServices

extension URL {
    var mimeType: String {
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, pathExtension as NSString, nil),
           let mt = UTTypeCopyPreferredTagWithClass(uti.takeRetainedValue(), kUTTagClassMIMEType) {
            return mt.takeRetainedValue() as String
        }
        return "application/octet-stream"
    }
    
    var isDistributedChatSchemed: Bool {
        scheme == "cliffapp"
    }
    
    var distributedChatAttachmentURL: URL? {
        // CliffApp:///attachment/a/b.txt refers to <Documents>/Attachments/a/b.txt
        
        if isDistributedChatSchemed && pathComponents[..<2] == ["/", "attachment"] {
            return persistenceFileURL(path: "Attachments/\(pathComponents[2...].joined(separator: "/"))")
        } else {
            return nil
        }
    }
    var smartResolved: URL {
        distributedChatAttachmentURL ?? self
    }
    
    func smartCheckResourceIsReachable() throws -> Bool {
        try smartResolved.checkResourceIsReachable()
    }
}
