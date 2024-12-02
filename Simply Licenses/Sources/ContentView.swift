//
//  ContentView.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View
{
    @Environment(AppState.self) var appState: AppState

    @Query
    var savedLicenses: [License]

    @Query
    var categories: [LicenseCategory]

    // MARK: - Selections for navigation

    @State private var selectedCategory: LicenseCategory?
    @State private var selectedLicense: License?

    var body: some View
    {
        @Bindable var appState: AppState = appState

        NavigationSplitView(columnVisibility: Binding(get: {
            categories.isEmpty ? .doubleColumn : .all
        }, set: { visibility in
            visibility
        }))
        {
            SidebarView(selectedCategory: $selectedCategory)
        } content: {
            LicensesList(selectedLicense: $selectedLicense)
        } detail: {
            LicenseDetail(selectedLicense: selectedLicense)
        }
        .sheet(item: $appState.sheetToShow)
        { sheetType in
            switch sheetType
            {
            case .licenseAddition:
                LicenseAdditionSheet()
            case .categoryAddition:
                CategoryAdditionSheet()
            case .licenseEditing(let licenseToEdit):
                LicenseEditingSheet(licenseToEdit: licenseToEdit)
            }
        }
        .alert(isPresented: $appState.isShowingAlert, error: appState.alertToShow)
        { alertType in
            switch alertType
            {
            case .forbiddenToDeleteLastLicenseKey:
                EmptyView()
            case .genericWithLocalizedError:
                EmptyView()
            }
        } message: { alertType in
            if let recoverySuggestion = alertType.recoverySuggestion
            {
                Text(recoverySuggestion)
            }
        }
    }
}
