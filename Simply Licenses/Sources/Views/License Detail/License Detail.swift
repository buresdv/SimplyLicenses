//
//  License Detail.swift
//  Simply Licenses
//
//  Created by David Bureš on 29.11.2024.
//

import SwiftUI

struct LicenseDetail: View
{
    @Environment(AppState.self) var appState: AppState
    
    let selectedLicense: License?

    var body: some View
    {
        Group
        {
            if let selectedLicense
            {
                Form
                {
                    TextField(text: .constant(selectedLicense.softwareName!))
                    {
                        Text("add-license.software-name.label")
                    }

                    Section
                    {
                        if let licenseKey = selectedLicense.licenseKey
                        {
                            List(licenseKey, id: \.self)
                            { licenseKey in
                                Text(licenseKey)
                                    .contextMenu
                                    {
                                        Button
                                        {
                                            let pasteboard: NSPasteboard = NSPasteboard.general
                                            pasteboard.declareTypes([.string], owner: nil)
                                            pasteboard.setString(licenseKey, forType: .string)
                                        } label: {
                                            Text("action.copy")
                                        }
                                    }
                            }
                        }
                        else
                        {
                            Text("add-license.license-key.none-available")
                        }
                    } header: {
                        Text("add-license.license-key.label")
                    }
                }
                .formStyle(.grouped)
            }
            else
            {
                ContentUnavailableView
                {
                    Label("license.no-license-selected.title", systemImage: "lanyardcard.fill")
                } description: {
                    Text("license.no-license-selected.description")
                }
            }
        }
        .toolbar
        {
            ToolbarItem
            {
                Button
                {
                    appState.showSheet(ofType: .licenseEditing(licenseToEdit: selectedLicense!))
                } label: {
                    Label("action.edit", systemImage: "pencil")
                }
                .disabled(selectedLicense == nil)
            }
        }
    }
}
