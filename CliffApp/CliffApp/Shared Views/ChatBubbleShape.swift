//
//  ChatBubble.swift
//  CliffApp
//
//  Created by NAVEEN MADHAN on 4/2/22.
//

import SwiftUI

struct ChatBubble: Shape {
    var isMe : Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,isMe ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}



struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isMe: false)
    }
}
