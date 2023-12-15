//
//  File.swift
//
//
//  Created by AFuture on 2023/12/13.
//

import ComposableArchitecture
import Foundation

extension ContactsFeatureState {
    @CasePathable
    enum Destination: Equatable {
        case addContact(AddContactFeature.State)
        case confirmDeleteAlert(AlertState<ContactsFeatureAction.Destination.Alert>)
    }
}

extension ContactsFeatureAction {
    
    @CasePathable
    enum Destination: Equatable {
        case addContact(AddContactFeature.Action)
        case confirmDeleteAlert(Alert)
        
        enum Alert: Equatable {
            case confirm(id: Contact.ID)
        }
    }
}

extension ContactsFeature {
    
    struct Destination: Reducer {

        var body: some Reducer<ContactsFeatureState.Destination, ContactsFeatureAction.Destination> {
            Scope(state: \.addContact, action: \.addContact) {
                AddContactFeature()
            }
        }
    }
}

extension AlertState where Action == ContactsFeature.Destination.Action.Alert {
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
