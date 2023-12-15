//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/11.
//

import Foundation
import ComposableArchitecture
import Domain


public struct AddContactFeature: Reducer {
    @Dependency(\.dismiss) var dismiss
    
    public init() {}
    
    public var body: some Reducer<AddContactFeatureState, AddContactFeatureAction> {
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
