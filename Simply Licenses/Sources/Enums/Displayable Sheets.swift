//
//  Displayable Sheets.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import Foundation

enum DisplayableSheet: String, RawRepresentable, CustomStringConvertible, Identifiable
{
    var id: Self
    {
        return self
    }

    case licenseAddition
    case categoryAddition

    var description: String
    {
        switch self
        {
        case .licenseAddition:
            return String(localized: "interface.sheet.license-addition.description")
        case .categoryAddition:
            return String(localized: "interface.sheet.category-addition.description")
        }
    }

    var sheetTitle: LocalizedStringResource
    {
        switch self
        {
        case .licenseAddition:
            return "interface.sheet.license-addition.sheet-title"
        case .categoryAddition:
            return "interface.sheet.category-addition.sheet-title"
        }
    }
}
