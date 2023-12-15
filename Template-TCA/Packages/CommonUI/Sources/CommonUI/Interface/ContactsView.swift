//
//  File.swift
//  
//
//  Created by AFuture on 2023/12/11.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import Domain
import Common

public struct ContactsView: View {
    private let store: StoreOf<ContactsFeature>
    
    public init(store: StoreOf<ContactsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        NavigationStackStore(self.store.scope(state: \.navigationPath, action: \.contactOnPath)) {
            WithViewStore(self.store, observe: \.contacts) { viewStore in
                List {
                    ForEach(viewStore.state) { contact in
                        NavigationLink(state: ContactDetailFeature.State(contact: contact)) {
                            HStack {
                                Text(contact.name)
                                Spacer()
                                Button {
                                    viewStore.send(.deleteButtonTapped(id: contact.id))
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .buttonStyle(.borderless)
                    }
                }
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewStore.send(.addButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        } destination: { store in
            ContactDetailView(store: store)
        }
        .sheet( store: self.store.scope(
            state: \.$present.addContact,
            action: \.present.addContact
        )) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
        .alert( store: self.store.scope(
            state: \.$present.confirmDeleteAlert,
            action: \.present.confirmDeleteAlert
        ))
    }
}

#Preview {
    ContactsView(
        store: Store(
            initialState: ContactsFeature.State(
                contacts: [
                    Contact(id: UUID(), name: "Blob"),
                    Contact(id: UUID(), name: "Blob Jr"),
                    Contact(id: UUID(), name: "Blob Sr"),
                ]
            )
        ) {
            ContactsFeature()
        }
    )
}
