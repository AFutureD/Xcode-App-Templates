//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/12.
//

import Foundation
import ComposableArchitecture


struct ContactDetailFeatureState: Equatable {
    @PresentationState var present: ContactDetailFeatureState.Destination?
    
    let contact: Contact
}

@CasePathable
enum ContactDetailFeatureAction {
    
    case present(PresentationAction<Destination>)
    
    case deleteButtonTapped
    
    case delegate(Delegate)
    enum Delegate {
        case confirmDeletion
    }
}

@Reducer
struct ContactDetailFeature {
    
    @Dependency(\.dismiss) var dismiss
    var body: some Reducer<ContactDetailFeatureState, ContactDetailFeatureAction> {
        Reduce { state, action in
            switch action {
            case .present(.presented(.alert(.confirmDeletion))):
                return .run { send in
                    await send(.delegate(.confirmDeletion))
                    await self.dismiss()
                }
            case .delegate:
                return .none
            case .deleteButtonTapped:
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
