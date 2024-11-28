//
//  SimplyLicensesApp.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI
import SwiftData
import Simply_Licenses_Shared

@main
struct SimplyLicensesApp: App
{
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
        }
        .modelContainer(for: [License.self], inMemory: true, isAutosaveEnabled: true, isUndoEnabled: true) { modelContainerSetupResult in
            switch modelContainerSetupResult {
            case .success(let success):
                AppConstants.shared.logger.info("Model container initialized")
            case .failure(let failure):
                AppConstants.shared.logger.error("Failed to initialize model container")
            }
        }
    }
}
