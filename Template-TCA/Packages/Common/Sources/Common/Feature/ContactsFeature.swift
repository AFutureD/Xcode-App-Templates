//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/11.
//

import Foundation
import ComposableArchitecture
import Domain


public struct ContactsFeature: Reducer {
        
    @Dependency(\.uuid) var uuid
    
    public init() {}
    
    public var body: some Reducer<ContactsFeatureState, ContactsFeatureAction> {
        Reduce { state, action in
            switch action {
            case let .present(presentAction):
                return self.presentReduce(state: &state, action: presentAction)
                
            case .inner(.addButtonTapped):
                state.present = .addContact(
                    AddContactFeature.State(
                        contact: Contact(id: self.uuid(), name: "")
                    )
                )
                return .none
                
            case let .inner(.deleteButtonTapped(id: id)):
                state.present = .confirmDeleteAlert(.deleteConfirmation(id: id))
                return .none
                
            case let .contactOnPath(.element(id: id, action: .delegate(.confirmDeletion))):
                guard let detailState = state.navigationPath[id: id] else {
                    return .none
                }
                state.contacts.remove(id: detailState.contact.id)
                return .none
                
            default:
                return .none
            }
        }
        .ifLet(\.$present, action: \.present) {
            Destination()
        }
        .forEach(\.navigationPath, action: \.contactOnPath) {
            ContactDetailFeature()
        }
    }
}

extension ContactsFeature {
    func presentReduce(
        state: inout Self.State,
        action: PresentationAction<ContactsFeatureAction.Destination>
    ) -> Effect<Self.Action> {
        switch action {
        case let .presented(.addContact(.delegate(.saveContact(contact)))):
            state.contacts.append(contact)
            return .none
            
        case let .presented(.confirmDeleteAlert(.confirm(id: id))):
            state.contacts.remove(id: id)
            return .none
            
        default:
            return .none
        }
    }
}

extension ContactsFeature {
    
    public struct Destination: Reducer {
        
        public var body: some Reducer<ContactsFeatureState.Destination, ContactsFeatureAction.Destination> {
            Scope(state: \.addContact, action: \.addContact) {
                AddContactFeature()
            }
        }
    }
}
