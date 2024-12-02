//
//  License List Item.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI

struct LicenseListItem: View
{
    @Bindable var licenseItem: License

    var body: some View
    {
        NavigationLink(value: licenseItem)
        {
            licenseLabel(softwareName: licenseItem.softwareName, licenseCount: licenseItem.licenseKey.count)
        }
    }

    @ViewBuilder
    func licenseLabel(softwareName: String, licenseCount: Int) -> some View
    {
        VStack(alignment: .leading)
        {
            Text(softwareName)

            Text("label.number-of-licenses.\(licenseCount)")
                .font(.subheadline)
                .tint(.secondary)
        }
    }
}
