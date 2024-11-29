//
//  ContentView.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View
{
    @Environment(AppState.self) var appState: AppState
    
    @Query
    var savedLicenses: [License]
    
    var body: some View
    {
        @Bindable var appState: AppState = appState
        
        NavigationSplitView(columnVisibility: Binding(get: {
            savedLicenses.isEmpty ? .doubleColumn : .all
        }, set: { visibility in
            visibility
        }))
        {
            SidebarView()
        } content: {
            LicensesList()
        } detail: {
            Text("Detail")
        }
        .sheet(item: $appState.sheetToShow) { sheetType in
            switch sheetType
            {
            case .licenseAddition:
                LicenseAdditionSheet()
            case .categoryAddition:
                CategoryAdditionSheet()
            }
        }
    }
}
