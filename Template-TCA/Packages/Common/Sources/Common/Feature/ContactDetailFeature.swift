//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/12.
//

import Foundation
import ComposableArchitecture
import Domain


@Reducer
public struct ContactDetailFeature {
    
    @Dependency(\.dismiss) var dismiss
    
    public init() {}
    
    public var body: some Reducer<ContactDetailFeatureState, ContactDetailFeatureAction> {
        Reduce { state, action in
            switch action {
            case .present(.presented(.alert(.confirmDeletion))):
                return .run { send in
                    await send(.delegate(.confirmDeletion))
                    await self.dismiss()
                }
                
            case .inner(.deleteButtonTapped):
                state.present = .alert(.confirmDeletion)
                return .none

            default:
                return .none
            }
        }
        .ifLet(\.$present, action: \.present) {
            ContactDetailFeature.Destination()
        }
    }
}

extension ContactDetailFeature {
    
    struct Destination: Reducer {
        var body: some Reducer<ContactDetailFeatureState.Destination, ContactDetailFeatureAction.Destination> {
            EmptyReducer()
        }
        
    }
    
}

extension AlertState where Action == ContactDetailFeatureAction.Destination.Alert {
    static let confirmDeletion = Self {
        TextState("Are you sure?")
    } actions: {
        ButtonState(role: .destructive, action: .confirmDeletion) {
            TextState("Delete")
        }
    }
}
