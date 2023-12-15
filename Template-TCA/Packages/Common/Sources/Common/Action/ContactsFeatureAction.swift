//
//  File.swift
//  
//
//  Created by 尼诺 on 2023/12/15.
//

import Foundation
import Domain
import ComposableArchitecture

@CasePathable
public enum ContactsFeatureAction {
    case addButtonTapped
    case deleteButtonTapped(id: Contact.ID)
    case present(PresentationAction<Destination>)
    case contactOnPath(StackAction<ContactDetailFeature.State, ContactDetailFeature.Action>)
}

extension ContactsFeatureAction {
    
    @CasePathable
    public enum Destination: Equatable {
        case addContact(AddContactFeature.Action)
        case confirmDeleteAlert(Alert)
        
        @CasePathable
        public enum Alert: Equatable {
            case confirm(id: Contact.ID)
        }
    }
}
