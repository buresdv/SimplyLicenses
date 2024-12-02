//
//  Licenses List.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI
import SwiftData

struct LicensesList: View
{
    @Environment(\.modelContext) var modelContext: ModelContext
    
    @Environment(AppState.self) var appState: AppState
    
    @Query
    var savedLicenses: [License]
    
    @Binding var selectedLicense: License?
    
    @State private var searchText: String = ""
    
    var body: some View
    {
        Group
        {
            if savedLicenses.isEmpty
            {
                ContentUnavailableView {
                    Label("license.none-saved.add-prompt.title", systemImage: "lanyardcard.fill")
                } description: {
                    Text("license.none-saved.add-prompt.description")
                } actions: {
                    AddLicenseButton()
                }

            }
            else
            {
                List(selection: $selectedLicense)
                {
                    ForEach(savedLicenses)
                    { savedLicense in
                        LicenseListItem(licenseItem: savedLicense)
                    }
                    .onDelete(perform: deleteLicense)
                }
                .searchable(text: $searchText, placement: .automatic, prompt: "search.prompt")
            }
        }
        .toolbar
        {
            ToolbarItem(placement: .primaryAction) {
                AddLicenseButton()
            }
        }
    }
}

private extension LicensesList
{
    func deleteLicense(_ indexSet: IndexSet)
    {
        for index in indexSet
        {
            let licenseToDelete: License = savedLicenses[index]
            
            withAnimation
            {
                modelContext.delete(licenseToDelete)
            }
        }
    }
}
