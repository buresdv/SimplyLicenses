//
//  License Addition Sheet.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import Simply_Licenses_Shared
import SwiftData
import SwiftUI

struct LicenseAdditionSheet: View
{
    @Environment(\.modelContext) var modelContext: ModelContext
    
    @Environment(AppState.self) var appState: AppState

    enum FocusedField
    {
        case softwareName, licenseKeyField
    }

    @FocusState private var focusedField: FocusedField?

    @State private var newLicense_softwareName: String = ""
    @State private var newLicense_licenseKeyCurrentlyBeingEdited: String = ""

    @State private var newLicense_licenseKeys: [String] = .init()

    private var isAddLicenseButtonDisabled: Bool
    {
        newLicense_softwareName.isEmpty || newLicense_licenseKeys.isEmpty
    }

    private var isAddKeyToListOfKeysDisabled: Bool
    {
        newLicense_licenseKeyCurrentlyBeingEdited.isEmpty
    }

    var body: some View
    {
        SheetTemplate(sheetType: .licenseAddition)
        {
            Form
            {
                TextField(text: $newLicense_softwareName, prompt: Text("add-license.software-name.prompt"))
                {
                    Text("add-license.software-name.label")
                }
                .focused($focusedField, equals: .softwareName)

                Section("add-license.section.license-keys")
                {
                    List
                    {
                        Section
                        {
                            ForEach(newLicense_licenseKeys, id: \.self)
                            { key in
                                Text(key)
                            }
                        } header: {
                            HStack(alignment: .center)
                            {
                                licenseKeyInputField

                                addLicenseToListButton
                            }
                        }
                    }
                }
            }
            .formStyle(.grouped)
            .toolbar
            {
                ToolbarItem(placement: .primaryAction)
                {
                    saveLicenseButton
                }
            }
        }
        .onAppear
        {
            focusedField = .softwareName
        }
    }

    // MARK: - ViewBuilders

    @ViewBuilder
    var licenseKeyInputField: some View
    {
        TextField(text: $newLicense_licenseKeyCurrentlyBeingEdited, prompt: Text("add-license.license-key.prompt"))
        {
            Text("add-license.license-key.label")
        }
        .focused($focusedField, equals: .licenseKeyField)
        .onSubmit
        {
            focusedField = .licenseKeyField
            addLicenseToListOfLicenses()
        }
    }

    @ViewBuilder
    var addLicenseToListButton: some View
    {
        Button
        {
            addLicenseToListOfLicenses()
        } label: {
            Image(systemName: "plus")
        }
        .buttonStyle(.plain)
        .keyboardShortcut(.return)
        .disabled(isAddKeyToListOfKeysDisabled)
    }

    @ViewBuilder
    var saveLicenseButton: some View
    {
        Button
        {
            modelContext.insert(
                License(
                    category: nil,
                    softwareName: newLicense_softwareName,
                    softwareIconData: nil,
                    licenseKey: newLicense_licenseKeys
                )
            )
            
            appState.dismissSheet()
        } label: {
            Label("action.add-license", systemImage: "plus")
                .labelStyle(.titleOnly)
        }
        .disabled(isAddLicenseButtonDisabled)
    }
}

private extension LicenseAdditionSheet
{
    func addLicenseToListOfLicenses()
    {
        withAnimation
        {
            newLicense_licenseKeys.append(newLicense_licenseKeyCurrentlyBeingEdited)
        }
        newLicense_licenseKeyCurrentlyBeingEdited = ""
    }
}
