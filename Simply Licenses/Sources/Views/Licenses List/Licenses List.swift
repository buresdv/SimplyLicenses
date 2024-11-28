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
    @Environment(AppState.self) var appState
    
    @Query
    var savedLicenses: [License]
    
    var body: some View
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
    }
}
