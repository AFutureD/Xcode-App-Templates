//
//  File 3.swift
//  
//
//  Created by AFuture on 2023/12/11.
//

import Foundation
import OSLog

import ComposableArchitecture
import SwiftUI
import Common
import CommonUI


@main
struct MyApp: App {
    
    static let log = Logger()
    
    static let store = Store(initialState: ContactsFeature.State(contacts: [])) {
        ContactsFeature()._printChanges(.init(printChange: { receivedAction, oldState, newState in
            var target = ""
            target.write("received action:\n")
            CustomDump.customDump(receivedAction, to: &target, indent: 2)
            target.write("\n")
            target.write(diff(oldState, newState).map { "\($0)\n" } ?? "  (No state changes)\n")
            log.debug("\(target)")
        }))
    }
    
    var body: some Scene {
        WindowGroup {
            ContactsView(store: MyApp.store)
        }
    }
}
