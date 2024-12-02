//
//  License Editing.swift
//  Simply Licenses
//
//  Created by David Bureš on 02.12.2024.
//

import SwiftUI

struct LicenseEditingSheet: View
{
    @Environment(AppState.self) var appState: AppState
    
    @Bindable var licenseToEdit: License

    enum FocusedField
    {
        case softwareName, licenseKeyField
    }

    @FocusState private var focusedField: FocusedField?
    
    @State private var newLicense_licenseKeyCurrentlyBeingEdited: String = ""

    var body: some View
    {
        SheetTemplate(sheetType: .licenseEditing(licenseToEdit: licenseToEdit))
        {
            Form
            {
                TextField(text: $licenseToEdit.softwareName, prompt: Text("add-license.software-name.prompt"))
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
                            ForEach($licenseToEdit.licenseKey)
                            { $key in
                                TextField(text: $key.key)
                                {
                                    Text("add-license.section.license-key")
                                }
                                .swipeActions(edge: .trailing, allowsFullSwipe: true)
                                {
                                    Button(role: .destructive)
                                    {
                                        guard licenseToEdit.licenseKey.count > 1 else
                                        {
                                            appState.showAlert(ofType: .forbiddenToDeleteLastLicenseKey)
                                            return
                                        }
                                        
                                        if let keyIndextoDelete = licenseToEdit.licenseKey.firstIndex(where: { $0.id == key.id })
                                        {
                                            licenseToEdit.licenseKey.remove(at: keyIndextoDelete)
                                        }
                                    } label: {
                                        Label("action.delete-key", systemImage: "trash")
                                    }
                                }
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
        .disabled(newLicense_licenseKeyCurrentlyBeingEdited.isEmpty)
    }
}

private extension LicenseEditingSheet
{
    func addLicenseToListOfLicenses()
    {
        withAnimation
        {
            licenseToEdit.licenseKey.append(.init(key: newLicense_licenseKeyCurrentlyBeingEdited))
        }
        newLicense_licenseKeyCurrentlyBeingEdited = ""
    }
}
