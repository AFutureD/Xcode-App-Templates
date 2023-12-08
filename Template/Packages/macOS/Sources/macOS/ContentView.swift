//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/7.
//

import Foundation
import SwiftUI

public struct ContentView: View {
    public init () {}
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
