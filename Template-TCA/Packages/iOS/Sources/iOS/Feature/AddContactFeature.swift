//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/11.
//

import Foundation
import ComposableArchitecture


struct AddContactFeatureState: Equatable {
    var contact: Contact
}

@CasePathable
enum AddContactFeatureAction: Equatable {
    
    case inner(InnerAction)
    enum InnerAction:Equatable {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
    }
    
    case delegate(Delegate)
    enum Delegate: Equatable {
        case saveContact(Contact)
    }
}

struct AddContactFeature: Reducer {
    typealias State = AddContactFeatureState
    typealias Action = AddContactFeatureAction
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            guard case let .inner(innerAction) = action else {
                return .none
            }
            
            switch innerAction {
            case .cancelButtonTapped:
                return .run { _ in await self.dismiss() }
                
            case .saveButtonTapped:
                return .run { [contact = state.contact] send in
                    await send(.delegate(.saveContact(contact)))
                    await self.dismiss()
                }
                
            case .setName(let name):
                state.contact.name = name
                return .none
            }
        }
    }
}
