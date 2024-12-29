//
//  SimplyLicensesApp.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import Simply_Licenses_Shared
import SwiftData
import SwiftUI

@main
struct SimplyLicensesApp: App
{
    @State var appState: AppState = .init()
    
    var modelContainer: ModelContainer = {
        let schema: Schema = .init([
            License.self
        ])

        let modelConfiguration: ModelConfiguration = .init(schema: schema, isStoredInMemoryOnly: false)

        do
        {
            return try ModelContainer(for: schema, configurations: modelConfiguration)
        }
        catch let modelContainerCreationError
        {
            fatalError("Failed to create model container: \(modelContainerCreationError.localizedDescription)")
        }
    }()

    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
        }
        .environment(appState)
        .modelContainer(modelContainer)
        .commands
        {
            CommandGroup(before: .textEditing)
            {
                AddLicenseButton()
                    .environment(appState)
                    .modelContainer(modelContainer)
            }
        }
    }
}
