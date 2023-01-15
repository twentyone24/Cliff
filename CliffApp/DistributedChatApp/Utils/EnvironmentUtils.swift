//
//  EnvironmentUtils.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import Foundation

func isRunningInSwiftUIPreview() -> Bool {
    #if DEBUG
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    #else
    return false
    #endif
}
