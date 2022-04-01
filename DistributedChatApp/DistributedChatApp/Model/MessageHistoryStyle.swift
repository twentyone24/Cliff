//
//  MessageHistoryStyle.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

enum MessageHistoryStyle: String, CaseIterable, Hashable, CustomStringConvertible, Codable {
    case compact = "Compact"
    case bubbles = "Bubbles"
    
    var description: String { rawValue }
}
