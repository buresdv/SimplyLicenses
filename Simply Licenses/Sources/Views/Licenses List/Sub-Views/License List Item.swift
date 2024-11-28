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
            Text(licenseSoftwareName)
        }
        else
        {
            Text("license.name-missing")
        }
    }
}
