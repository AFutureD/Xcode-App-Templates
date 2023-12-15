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
public enum ContactDetailFeatureAction {
    
    case present(PresentationAction<Destination>)
    
    case inner(Inner)
    public enum Inner {
        case deleteButtonTapped
    }
    
    case delegate(Delegate)
    public enum Delegate {
        case confirmDeletion
    }
}

extension ContactDetailFeatureAction {
    
    @CasePathable
    public enum Destination {
        case alert(Alert)
        public enum Alert {
            case confirmDeletion
        }
    }
    
}
