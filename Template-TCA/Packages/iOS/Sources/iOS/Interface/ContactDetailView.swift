//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/12.
//

import Foundation
import ComposableArchitecture
import SwiftUI


struct ContactDetailView: View {
    let store: StoreOf<ContactDetailFeature>
    
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form {
                Button("Delete") {
                    viewStore.send(.deleteButtonTapped)
                }
            }
            .navigationBarTitle(Text(viewStore.contact.name))
        }
        .alert(store: self.store.scope(
            state: \.$present.alert,
            action: \.present.alert
        ))
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(
            store: Store(
                initialState: ContactDetailFeature.State(
                    contact: Contact(id: UUID(), name: "Blob")
                )
            ) {
                ContactDetailFeature()
            }
        )
    }
}
