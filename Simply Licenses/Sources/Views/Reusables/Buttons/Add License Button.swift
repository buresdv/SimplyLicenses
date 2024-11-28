//
//  Add License Button.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI

struct AddLicenseButton: View
{
    @Environment(AppState.self) var appState: AppState
    
    var body: some View
    {
        Button {
            appState.showSheet(ofType: .licenseAddition)
        } label: {
            Label("action.add-license", systemImage: "plus")
        }
    }
}
