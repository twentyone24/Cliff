//
//  PersistenceError.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

enum PersistenceError: Error {
    case couldNotReadSecurityScoped
    case couldNotReadData
    case invalidDistributedChatURL(String)
}
