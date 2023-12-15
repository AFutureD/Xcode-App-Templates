//
//  File.swift
//  
//
//  Created by 尼诺 on 2023/12/15.
//

import Foundation
import ComposableArchitecture
import Domain

public struct ContactsFeatureState: Equatable {
    
    @PresentationState
    public var present: Destination? = nil
    
    public var navigationPath = StackState<ContactDetailFeature.State>()
    
    public var contacts: IdentifiedArrayOf<Contact> = []
    
    public init(contacts: IdentifiedArrayOf<Contact>) {
        self.contacts = contacts
    }
}

extension ContactsFeatureState {
    @CasePathable
    public enum Destination: Equatable {
        case addContact(AddContactFeature.State)
        case confirmDeleteAlert(AlertState<ContactsFeatureAction.Destination.Alert>)
    }
}

extension AlertState where Action == ContactsFeatureAction.Destination.Alert {
    static func deleteConfirmation(id: UUID) -> Self {
        Self {
            TextState("Are you sure?")
        } actions: {
            ButtonState(role: .destructive, action: .confirm(id: id)) {
                TextState("Delete")
            }
        }
    }
}

