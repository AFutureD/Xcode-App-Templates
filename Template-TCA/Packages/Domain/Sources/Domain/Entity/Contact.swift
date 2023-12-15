//
//  File.swift
//  
//
//  Created by 尼诺 on 2023/12/15.
//

import Foundation

public struct Contact: Equatable, Identifiable {
    public let id: UUID
    public var name: String
    
    public init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
