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
        if let licenseSoftwareName = licenseItem.softwareName
        {
            NavigationLink(value: licenseItem)
            {
                licenseLabel(softwareName: licenseSoftwareName, licenseCount: licenseItem.licenseKey?.count ?? 0)
            }
        }
        else
        {
            Text("license.name-missing")
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
