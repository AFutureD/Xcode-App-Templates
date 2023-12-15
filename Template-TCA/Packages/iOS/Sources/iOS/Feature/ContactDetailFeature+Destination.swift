//
//  File.swift
//  
//
//  Created by 尼诺 on 2023/12/15.
//

import Foundation
import ComposableArchitecture


extension ContactDetailFeatureState {
    
    @CasePathable
    enum Destination: Equatable {
        case alert(AlertState<ContactDetailFeatureAction.Destination.Alert>)
    }
}

extension ContactDetailFeatureAction {
    
    @CasePathable
    enum Destination {
        case alert(Alert)
        enum Alert {
            case confirmDeletion
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
