//
//  File 3.swift
//  
//
//  Created by AFuture on 2023/12/11.
//

import Foundation
import SwiftUI


import ComposableArchitecture
import SwiftUI


@main
struct MyApp: App {
//    static let store = Store(initialState: CounterFeature.State()) {
//        CounterFeature()
//    }
    
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            // CounterView(store: MyApp.store)
            ContactsView(store: MyApp.store)
        }
    }
}
