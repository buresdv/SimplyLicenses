//
//  License Addition Sheet.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI

struct LicenseAdditionSheet: View
{
    var body: some View
    {
        SheetTemplate(sheetType: .licenseAddition) {
            Text("debug.hello")
        }
    }
}

#Preview
{
    LicenseAdditionSheet()
}
