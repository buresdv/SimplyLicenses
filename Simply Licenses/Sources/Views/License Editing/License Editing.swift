//
//  License Editing.swift
//  Simply Licenses
//
//  Created by David Bureš on 02.12.2024.
//

import SwiftUI

struct LicenseEditingSheet: View
{
    @Bindable var licenseToEdit: License

    enum FocusedField
    {
        case softwareName, licenseKeyField
    }

    @FocusState private var focusedField: FocusedField?

    var body: some View
    {
        SheetTemplate(sheetType: .licenseAddition)
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
                            ForEach($licenseToEdit.licenseKey, id: \.id)
                            { $key in
                                TextField(text: $key.key)
                                {
                                    Text("add-license.section.license-key")
                                }
                            }
                        } header: {
                            HStack(alignment: .center)
                            {
                            }
                        }
                    }
                }
            }
            .formStyle(.grouped)
        }
        .formStyle(.grouped)
    }
}
