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
public enum AddContactFeatureAction: Equatable {
    
    case inner(InnerAction)
    public enum InnerAction:Equatable {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
    }
    
    case delegate(Delegate)
    public enum Delegate: Equatable {
        case saveContact(Contact)
    }
}
