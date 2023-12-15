//
//  File 3.swift
//  
//
//  Created by 尼诺 on 2023/12/15.
//

import Foundation
import ComposableArchitecture
import Domain

public struct ContactDetailFeatureState: Equatable {
    @PresentationState
    public var present: ContactDetailFeatureState.Destination?
    
    public let contact: Contact
    
    public init(present: ContactDetailFeatureState.Destination? = nil, contact: Contact) {
        self.present = present
        self.contact = contact
    }
}

extension ContactDetailFeatureState {
    
    @CasePathable
    public enum Destination: Equatable {
        case alert(AlertState<ContactDetailFeatureAction.Destination.Alert>)
    }
}
