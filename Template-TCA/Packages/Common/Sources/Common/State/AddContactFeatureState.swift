//
//  File 2.swift
//  
//
//  Created by 尼诺 on 2023/12/15.
//

import Foundation
import Domain

public struct AddContactFeatureState: Equatable {
    public var contact: Contact
    
    public init(contact: Contact) {
        self.contact = contact
    }
}
